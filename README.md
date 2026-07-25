# evs-erp-mcp

MCP server cho **Claude Desktop** tạo project / module / work-package / task thật trên EVS ERP,
bằng chính tài khoản ERP của bạn. Không cần cài Node.

## Cài đặt

### macOS
Mở Terminal, dán:
```bash
curl -fsSL https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.command -o ~/Downloads/install.command && bash ~/Downloads/install.command
```

### Windows
Tải [install.bat](https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.bat) → double-click.

Nhập email + mật khẩu ERP → Enter → restart Claude Desktop. Xong.

Installer tự tải binary từ [Releases](../../releases/latest), lưu `refresh_token` (30 ngày),
và cấu hình Claude Desktop. Mật khẩu **không** được lưu.

## Dùng

Trong Claude Desktop: "liệt kê project của tôi" → chọn project → "tạo module/WP/task ...".

## Cập nhật

Sau khi cài, muốn lên bản mới nhất:

```bash
erp update            # macOS (nếu có lệnh ngắn)
~/.evs-erp-mcp/evs-erp-mcp update   # macOS đầy đủ
```
Windows: `"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" update`

Tự tải binary mới nhất và thay tại chỗ, không phải login lại. Restart Claude Desktop sau đó.
