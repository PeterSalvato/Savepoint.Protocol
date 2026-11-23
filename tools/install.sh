# Savepoint Protocol CLI
# Author: Peter Salvato
# License: See LICENSE.md
# (c) 2025 Peter Salvato. All rights reserved.

#!/bin/bash

REPO_URL="https://github.com/peterSalvato/Savepoint.Protocol.git"
INSTALL_PATH="/usr/local/bin/sp"

# ──────────────────────────────────────────────
# Detect if running inside the repo
# ──────────────────────────────────────────────
if [[ ! -f "sp" || ! -d "bin" ]]; then
  echo "📦 Cloning Savepoint.Protocol into temp directory..."
  TMPDIR=$(mktemp -d)
  git clone "$REPO_URL" "$TMPDIR"
  cd "$TMPDIR/tools" || exit 1
else
  echo "📁 Installing from local tools/ directory..."
fi

# ──────────────────────────────────────────────
# Make CLI scripts executable
# ──────────────────────────────────────────────
chmod +x sp
chmod +x bin/*.sh

# ──────────────────────────────────────────────
# Install symlink
# ──────────────────────────────────────────────
echo "🔗 Installing CLI command: sp"
sudo rm -f "$INSTALL_PATH"
sudo ln -s "$(pwd)/sp" "$INSTALL_PATH"

# ──────────────────────────────────────────────
# Final Confirmation
# ──────────────────────────────────────────────
if command -v sp &> /dev/null; then
  echo "✅ Savepoint CLI installed!"
  echo "Try: sp extract --help"
else
  echo "❌ CLI install failed. Check permissions or symlink path."
fi
