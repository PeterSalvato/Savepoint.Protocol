
from datetime import datetime
from pathlib import Path
import json
import re

def extract(args):
    source = Path(args.source) if args.source else Path("conversations.json")
    output_dir = Path(args.output) if args.output else Path("savepoints")
    prefix = args.prefix or ""
    suffix = f".{args.suffix}" if args.suffix else ""
    date_range = args.dates.split(":") if args.dates else []

    # Convert date range to datetime objects
    start_date = datetime.fromisoformat(date_range[0]) if len(date_range) > 0 else None
    end_date = datetime.fromisoformat(date_range[1]) if len(date_range) > 1 else None

    # Load source
    try:
        with open(source, "r", encoding="utf-8") as f:
            conversations = json.load(f)
    except Exception as e:
        print(f"❌ Failed to read source file: {e}")
        return

    output_dir.mkdir(parents=True, exist_ok=True)
    timestamp_slug = datetime.now().strftime("%m%d.%H%M")
    output_file = output_dir / f"savepoints.index.{timestamp_slug}{suffix}.md"

    savepoint_blocks = []
    for convo in conversations:
        title = convo.get("title", "")
        if prefix and not title.startswith(prefix):
            continue

        for msg_id, msg in convo.get("mapping", {}).items():
            message = msg.get("message")
            if not message:
                continue
            parts = message.get("content", {}).get("parts", [])
            for part in parts:
                if re.search(r"<Savepoint\s+[^>]*protocol_version:", part):
                    # Check timestamp filtering
                    timestamp_match = re.search(r"timestamp:(\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2})", part)
                    if timestamp_match:
                        ts = datetime.fromisoformat(timestamp_match.group(1))
                        if (start_date and ts < start_date) or (end_date and ts > end_date):
                            continue
                    savepoint_blocks.append(part.strip())

    if not savepoint_blocks:
        print("⚠️ No matching Savepoints found.")
        return

    with open(output_file, "w", encoding="utf-8") as out:
        out.write("\n\n---\n\n".join(savepoint_blocks))

    print(f"✅ Extracted {len(savepoint_blocks)} Savepoints.")
    print(f"📝 Written to: {output_file}")
