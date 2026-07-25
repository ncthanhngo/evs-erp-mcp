#!/bin/bash
# install.command — macOS: tải binary EVS ERP MCP + login + cấu hình Claude Desktop.
# Double-click file này (hoặc chạy: bash install.command).
set -e

REPO="ncthanhngo/evs-erp-mcp"   # TODO: đổi thành repo GitHub chứa Release
DEST="$HOME/.evs-erp-mcp"
BIN="$DEST/evs-erp-mcp"

mkdir -p "$DEST"

if [ "$(uname -m)" = "arm64" ]; then
  ASSET="evs-erp-mcp-macos-arm64"
else
  ASSET="evs-erp-mcp-macos-x64"
fi
URL="https://github.com/$REPO/releases/latest/download/$ASSET"

echo "Đang tải $ASSET ..."
curl -fsSL "$URL" -o "$BIN"
chmod +x "$BIN"
# Gỡ cờ quarantine để macOS không chặn app chưa ký.
xattr -d com.apple.quarantine "$BIN" 2>/dev/null || true

echo
"$BIN" setup

# Tạo lệnh ngắn `erp` (best-effort) để sau này gõ: erp update
if ln -sf "$BIN" /usr/local/bin/erp 2>/dev/null; then
  UPDATE_CMD="erp update"
else
  UPDATE_CMD="$BIN update"
fi
echo
echo "Cập nhật sau này:  $UPDATE_CMD"
echo "Xong. Đóng cửa sổ này."
