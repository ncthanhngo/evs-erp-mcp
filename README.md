# evs-erp-mcp

Kết nối trợ lý AI (ChatGPT · Claude web · Claude Code CLI · Claude Desktop) với **ERP Evselab**:
tạo và **sửa** dự án / hạng mục / gói công việc / task **thật**, bằng chính tài khoản ERP của bạn.
Phân quyền do ERP enforce — bạn chỉ làm được đúng những gì tài khoản mình được phép.

> 📖 Người mới, chưa rành kỹ thuật? Đọc [HƯỚNG DẪN CHI TIẾT](HUONG-DAN.md).

## Cách nhanh nhất — không cài gì ⭐

Dành cho **ChatGPT web/desktop · Claude web · Claude Code CLI**.

1. Vào **Settings → Connectors** của ứng dụng, thêm connector:
   ```
   https://mcp.evselab.com/mcp
   ```
2. Ứng dụng mở trang đăng nhập ERP → nhập email + mật khẩu ERP → **Cho phép**. Xong.

Connector này gắn vào **tài khoản claude.ai**, không phải riêng trang web — nên **Claude Code CLI
đăng nhập cùng tài khoản sẽ tự có**, không phải khai báo gì. Kiểm tra:

```bash
claude mcp list
# claude.ai ERP: https://mcp.evselab.com/mcp - ✔ Connected
```

## Khi nào mới phải cài lên máy

Chỉ 3 trường hợp: **Claude Desktop (app)** — app không dùng được connector remote; **Gemini CLI /
Codex CLI**; hoặc **Claude Code CLI đăng nhập bằng API key / Bedrock / Vertex** (không có connector
theo tài khoản).

**macOS** — mở Terminal, dán:
```bash
curl -fsSL https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.command -o ~/Downloads/install.command && bash ~/Downloads/install.command
```
**Windows** — tải [install.bat](https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.bat) → double-click.

Nhập email + mật khẩu ERP → Enter → restart app. Installer tự tải binary từ
[Releases](../../releases/latest), lưu `refresh_token` (30 ngày) và cấu hình Claude Desktop.
Mật khẩu **không** được lưu.

## Làm được gì

| Công cụ | Việc |
|---|---|
| `evs_list_projects` · `evs_select_project` | liệt kê / chọn dự án (mã, tên viết tắt, tên đầy đủ) |
| `evs_create_project` · `evs_create_module` · `evs_create_work_package` | tạo dự án / hạng mục / gói công việc |
| `evs_list_structure` | xem cây dự án kèm số vị trí (`1` = hạng mục, `1.1` = gói công việc) |
| `evs_list_people` | liệt kê nhân sự để giao việc |
| `evs_create_task` | tạo task kèm mô tả, mandays, RASCI + % effort từng người |
| `evs_list_tasks` | liệt kê task kèm số vị trí `1.1.2`, trạng thái, số công, người làm |
| `evs_update_task` | sửa task: tên, mô tả, ưu tiên, trạng thái, mandays, ngày, tiến độ, chuyển gói |
| `evs_assign_task` | giao lại việc: đặt vai trò RASCI + % effort, hoặc gỡ người khỏi task |

Ví dụ gõ trong trợ lý:

> **Chọn dự án PHN** → **Xem cấu trúc dự án** → **Tạo task "Viết driver UART" vào 1.1, 3 mandays, giao anh A làm chính (R)**
>
> **Liệt kê task trong 1.1** → **Sửa task 1.1.2: 4 mandays, ưu tiên cao** · **Giao task 1.1.2 cho chị B làm chính (R) 60%**

Mọi thay đổi là **thật** trên ERP, cả nhóm thấy ngay. Sửa/tạo hàng loạt thì trợ lý sẽ cho bạn xem
danh sách trước và chờ bạn đồng ý.

## Đăng nhập lại · Cập nhật (chỉ bản cài trên máy)

"Vé thông hành" hết hạn **30 ngày** → đăng nhập lại. Muốn lên bản mới → `update`.

```bash
erp login                           # lệnh ngắn installer tạo sẵn
erp update
~/.evs-erp-mcp/evs-erp-mcp login    # nếu chưa có lệnh ngắn
```
Windows: `"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" login` (hoặc `update`).

Bản remote (web / Claude Code CLI qua connector) **không cần cập nhật** — máy chủ luôn chạy bản mới.

## Gặp sự cố

- **Trợ lý nói không có công cụ ERP**, hoặc **có tool cũ nhưng thiếu tool mới**: danh sách công cụ
  được chụp lúc khởi động → thoát hẳn app rồi mở lại (Claude Code: `/exit` rồi `claude`).
- `claude mcp list` báo `! Needs authentication`: chạy lại 1-2 lần; vẫn kẹt thì kết nối lại connector
  ở claude.ai → Settings → Connectors.
- **Thấy 2 bộ công cụ ERP trùng nhau**: vừa có connector claude.ai vừa khai báo bản local. Bỏ bớt một —
  `claude mcp remove evs-erp -s user`, hoặc xoá connector ở claude.ai.

Chi tiết hơn: [HUONG-DAN.md](HUONG-DAN.md).
