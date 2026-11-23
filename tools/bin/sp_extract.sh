
#!/bin/bash
# Savepoint Protocol CLI
# Author: Peter Salvato
# License: See LICENSE.md
# (c) 2025 Peter Salvato. All rights reserved.

# ──────────────────────────────────────────────
# Flag parsing
# ──────────────────────────────────────────────
while [[ "$#" -gt 0 ]]; do
  case $1 in
    --prefix) PREFIX="$2"; shift ;;
    --label) LABEL="$2"; shift ;;
    --source) SOURCE="$2"; shift ;;
    -h|--help)
      echo "Usage: sp extract --prefix AE --label Review1 --source ./conversations.json"
      exit 0 ;;
    *) echo "❌ Unknown parameter: $1"; exit 1 ;;
  esac
  shift
done

# ──────────────────────────────────────────────
# Prompt for missing values
# ──────────────────────────────────────────────
if [ -z "$PREFIX" ]; then
  read -p "🔤 Prefix (leave blank for ALL): " PREFIX
fi

if [ -z "$LABEL" ]; then
  read -p "📝 Label for this extraction: " LABEL
  if [ -z "$LABEL" ]; then echo "❌ Label is required."; exit 1; fi
fi

if [ -z "$SOURCE" ]; then
  read -p "📁 Path to conversations.json (default: ./conversations.json): " SOURCE
  SOURCE="${SOURCE:-./conversations.json}"
fi

# Validate source file
SOURCE=$(eval echo "$SOURCE")
if [ ! -f "$SOURCE" ]; then
  echo "❌ File not found: $SOURCE"
  exit 1
fi

# ──────────────────────────────────────────────
# Output Directory & File Naming
# ──────────────────────────────────────────────
TIMESTAMP=$(date +"%m%d%y.%I%M%p" | tr '[:upper:]' '[:lower:]')
PREFIX_SAFE="${PREFIX:-ALL}"
BASE="${PREFIX_SAFE}.${LABEL}.extraction.${TIMESTAMP}"
OUTDIR="./$BASE"

mkdir -p "$OUTDIR"

MD_OUT="$OUTDIR/$BASE.sessions.md"
CSV_OUT="$OUTDIR/$BASE.flatlog.csv"
JSON_OUT="$OUTDIR/$BASE.raw.json"
META_OUT="$OUTDIR/$BASE.meta.txt"

touch "$MD_OUT" "$CSV_OUT" "$META_OUT"
echo "timestamp,chat_id,chat_title,session_start,role,message" > "$CSV_OUT"

SOURCE_MODIFIED=$(date -u -r "$SOURCE" +"%Y-%m-%d %H:%M:%S UTC")
SESSION_COUNT=0
MESSAGE_COUNT=0

# ──────────────────────────────────────────────
# Begin Extraction
# ──────────────────────────────────────────────
echo "🔍 Starting extraction:"
echo "• Prefix: '${PREFIX:-(ALL)}'"
echo "• Label : '$LABEL'"
echo "• Source: $SOURCE"
echo "• Output: $OUTDIR"
echo ""

jq -c '.[]' "$SOURCE" | while IFS= read -r convo; do
  TITLE=$(echo "$convo" | jq -r '.title')
  [[ -z "$PREFIX" || "$TITLE" == "$PREFIX"* ]] || continue

  CREATE=$(echo "$convo" | jq -r '.create_time')
  [[ "$CREATE" == "null" || -z "$CREATE" ]] && continue

  SESSION_ISO=$(date -u -d @"$CREATE" +"%Y-%m-%dT%H:%M:%SZ")
  SESSION_HUMAN=$(date -u -d @"$CREATE" +"%Y-%m-%d %H:%M")

  echo "→ [$SESSION_COUNT] $TITLE"
  echo "# $TITLE" >> "$MD_OUT"
  echo "*Started: $SESSION_HUMAN*" >> "$MD_OUT"
  echo "" >> "$MD_OUT"

  echo "{" >> "$JSON_OUT.tmp"
  echo "  \"title\": $(jq -n --arg t "$TITLE" '$t')," >> "$JSON_OUT.tmp"
  echo "  \"create_time\": \"$SESSION_ISO\"," >> "$JSON_OUT.tmp"
  echo "  \"messages\": [" >> "$JSON_OUT.tmp"

  MESSAGES=$(echo "$convo" | jq '.mapping | to_entries | map(.value) | map(select(.message.content.parts != null))')
  COUNT=$(echo "$MESSAGES" | jq length)

  for (( j=0; j<COUNT; j++ )); do
    MSG=$(echo "$MESSAGES" | jq ".[$j]")
    ROLE=$(echo "$MSG" | jq -r ".message.author.role // \"unknown\"")
    TEXT=$(echo "$MSG" | jq -r ".message.content.parts[0]" | tr -d '\r' | tr '\n' ' ')
    TS=$(echo "$MSG" | jq -r ".message.create_time")
    [[ "$TS" == "null" || -z "$TS" ]] && TS="$CREATE"
    ISO=$(date -u -d @"$TS" +"%Y-%m-%dT%H:%M:%SZ")

    echo "[$ISO] **$ROLE:** $TEXT" >> "$MD_OUT"
    echo "\"$ISO\",$SESSION_COUNT,\"$TITLE\",\"$SESSION_ISO\",\"$ROLE\",\"$TEXT\"" >> "$CSV_OUT"
    echo "    { \"timestamp\": \"$ISO\", \"role\": \"$ROLE\", \"content\": $(jq -n --arg txt "$TEXT" '$txt') }" >> "$JSON_OUT.tmp"
    if [ $j -lt $((COUNT - 1)) ]; then echo "," >> "$JSON_OUT.tmp"; fi

    ((MESSAGE_COUNT++))
  done

  echo "  ]" >> "$JSON_OUT.tmp"
  echo -n "}," >> "$JSON_OUT.tmp"
  echo "" >> "$MD_OUT"
  ((SESSION_COUNT++))
done

truncate -s-2 "$JSON_OUT.tmp"
echo "]" >> "$JSON_OUT.tmp"
mv "$JSON_OUT.tmp" "$JSON_OUT"

EXTRACT_TIME=$(date -u +"%Y-%m-%d %H:%M:%S UTC")
echo "Prefix: ${PREFIX:-(ALL)}" >> "$META_OUT"
echo "Label: $LABEL" >> "$META_OUT"
echo "Source: $SOURCE" >> "$META_OUT"
echo "Source Last Modified: $SOURCE_MODIFIED" >> "$META_OUT"
echo "Extraction Time: $EXTRACT_TIME" >> "$META_OUT"
echo "Sessions: $SESSION_COUNT" >> "$META_OUT"
echo "Messages: $MESSAGE_COUNT" >> "$META_OUT"
echo "Output: $OUTDIR" >> "$META_OUT"

echo ""
echo "✅ Done. Exported:"
echo "• $SESSION_COUNT sessions"
echo "• $MESSAGE_COUNT messages"
echo "• Folder: $OUTDIR"
