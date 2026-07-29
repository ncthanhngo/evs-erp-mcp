# Hướng dẫn dùng ERP trong trợ lý AI (Claude / ChatGPT / Gemini)

Tài liệu này giúp bạn kết nối trợ lý AI với **ERP Evselab**, để chỉ cần *gõ yêu cầu bằng tiếng Việt*
là AI tự tạo dự án, hạng mục, công việc thật trên ERP — không cần mở trình duyệt ERP.

> Làm **1 lần** (2–5 phút), sau đó dùng hằng ngày rất nhanh.

---

## 1. Cách đơn giản nhất — kết nối từ xa (không cài gì) ⭐

Máy chủ chạy sẵn tại **`https://mcp.evselab.com/mcp`**. Không tải, không cài — chỉ thêm 1 địa chỉ.

### ChatGPT (web/desktop) · Claude web (claude.ai)
1. Vào **Settings → Connectors** (nơi thêm connector / MCP) của ứng dụng.
2. Thêm connector mới, dán địa chỉ:
   ```
   https://mcp.evselab.com/mcp
   ```
3. Ứng dụng mở trang **đăng nhập ERP** → nhập email + mật khẩu ERP → **Cho phép**.
4. Xong → sang [mục 4](#4-kiểm-tra-đã-kết-nối-chưa).

> ChatGPT: tính năng connector tùy **gói** (thường Plus/Pro/Team/Enterprise, có thể phải bật "Developer mode").

### Claude Code CLI (dùng remote, khỏi cài binary)
```bash
# lấy token (nhập email/mật khẩu ERP):
evs-erp-mcp remote-login https://mcp.evselab.com
# → in sẵn lệnh, dán để khai báo:
claude mcp add evs-erp --transport http https://mcp.evselab.com/mcp --header "Authorization: Bearer <token>"
```

→ Nếu bạn dùng **ChatGPT web / Claude web**, chỉ cần mục này. Xong luôn.

---

## 2. Cài trên máy — Claude Desktop (app)

Claude Desktop **không** dùng được remote ở mục 1 — phải cài 1 file nhỏ.

### macOS
Mở **Terminal** (`Cmd+dấu cách`, gõ `Terminal`, Enter), dán rồi Enter:
```bash
curl -fsSL https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.command -o ~/Downloads/install.command && bash ~/Downloads/install.command
```
> macOS chặn "nhà phát triển không xác minh"? Chuột phải file → **Open** → **Open**.

### Windows
Tải [install.bat](https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.bat) → **bấm đúp**.
> "Windows protected your PC"? Bấm **More info** → **Run anyway**.

### Nhập tài khoản
```
Email ERP:  ← gõ email ERP rồi Enter
Mật khẩu:   ← gõ mật khẩu (KHÔNG hiện ký tự — bình thường) rồi Enter
```
Thấy `OK — đã kết nối ...` → **thoát hẳn Claude Desktop (Cmd+Q / đóng) rồi mở lại**.
Installer tự cấu hình giúp bạn → sang [mục 4](#4-kiểm-tra-đã-kết-nối-chưa).

---

## 3. Cài trên máy — Gemini CLI / Codex CLI

Các CLI này chạy binary trên máy. Cài + đăng nhập trước:

**macOS** — chạy installer như [mục 2] (tải binary về `~/.evs-erp-mcp/`), hoặc chỉ đăng nhập:
```bash
erp login                          # installer tạo sẵn lệnh ngắn này
~/.evs-erp-mcp/evs-erp-mcp login   # nếu chưa có lệnh ngắn
```
**Windows**: `"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" login`

Rồi khai báo:

### Gemini CLI — `~/.gemini/settings.json`
```json
{
  "mcpServers": {
    "evs-erp": { "command": "/Users/BAN/.evs-erp-mcp/evs-erp-mcp" }
  }
}
```

### Codex CLI — `~/.codex/config.toml`
```toml
[mcp_servers.evs-erp]
command = "/Users/BAN/.evs-erp-mcp/evs-erp-mcp"
args = []
```

(Windows: đường dẫn `%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe`.)
Xong → mở lại CLI → sang [mục 4](#4-kiểm-tra-đã-kết-nối-chưa).

---

## Bảng chọn nhanh

| Bạn dùng | Cách | Mục |
|---|---|---|
| **ChatGPT web/desktop, Claude web** | Remote (dán địa chỉ) | **[1]** ⭐ |
| **Claude Code CLI** | Remote hoặc local | [1] / [3] |
| **Claude Desktop** (app) | Cài binary | [2] |
| **Gemini CLI / Codex CLI** | Cài binary | [3] |

---

## 4. Kiểm tra đã kết nối chưa

Trong trợ lý, gõ thử:

> **Liệt kê các dự án của tôi trên ERP**

- ✅ **Đã kết nối**: trả về **danh sách dự án** (tên + mã). Lần đầu có thể hỏi cho phép dùng công cụ "evs-erp" → **Cho phép / Allow**.
- ❌ **Chưa kết nối**: nói "không có công cụ ERP" → xem [mục 8](#8-gặp-sự-cố).

---

## 5. Cách gọi nhanh: mã dự án + số vị trí

- Gọi **dự án** bằng **mã** (vd `PHN`), **tên viết tắt**, hoặc **tên đầy đủ**.
- Trong dự án, mọi thứ đánh **số thứ tự** (đếm từ 1, theo thứ tự hiển thị):
  - `1` = hạng mục (module) thứ 1
  - `1.1` = gói công việc (WP) thứ 1 trong hạng mục thứ 1
  - `1.1.2` = **công việc (task)** thứ 2 trong gói `1.1`

Xem cây để biết số:
> **Xem cấu trúc dự án PHN**
```
1. Cơ khí
   1.1 Khung xe
   1.2 Vỏ máy
2. Điện
   2.1 Mạch nguồn
```

Nhờ vậy bạn chỉ cần nói: *"tạo task trong **1.1** dự án **PHN**"*.

---

## 6. Việc thường dùng

### Chọn dự án
> **Chọn dự án PHN**

### Tạo hạng mục / gói công việc
> **Trong dự án PHN, tạo hạng mục "Firmware", rồi trong đó tạo gói công việc "Bring-up bo mạch"**

### Tạo dự án mới *(cần quyền)*
> **Tạo dự án mới tên "Nghiên cứu pin LFP", mã "LFP2026"**
> Thiếu quyền → AI báo lại, nhờ quản trị tạo hộ.

---

## 7. Chia việc lớn → nhiều task (mandays + RASCI + %)

Cách mạnh nhất: mô tả **một việc lớn**, để AI tự chia nhỏ và tạo hàng loạt.

> **Tôi cần làm bộ nguồn 3kW. Hãy chia thành các task chi tiết, mỗi task ghi mô tả, số mandays,
> và giao RASCI: thiết kế mạch giao anh A làm chính (R) 80%, chị B kiểm tra (C); layout PCB anh C (R).
> Sau đó tạo tất cả vào work package 1.1 dự án PHN.**

AI sẽ: nghĩ ra các task → **cho bạn xem trước** → khi bạn đồng ý thì tạo vào `1.1`.

**RASCI** (vai trò trong task):
**R** làm chính · **A** chịu trách nhiệm duyệt · **S** hỗ trợ · **C** được hỏi ý kiến · **I** được thông báo.
Mỗi người có thể mang nhiều chữ (vd `AR`) kèm **% effort**. Người được giao **tự động thành thành viên dự án**.

- **Người**: gọi bằng **tên / mã nhân viên / email**. Trùng tên → AI hỏi lại. Xem danh sách: *"liệt kê nhân sự"*.
- **Mandays**: số ngày công của task — nói *"task này 3 mandays"*.
- Không nêu người → task giao **chính bạn**, ưu tiên **trung bình**.

---

## 7b. Sửa task đã có

Xem task để biết số vị trí (dạng `1.1.2`):
> **Liệt kê task trong 1.1 dự án PHN**
```
- 1.1.1 Viết driver UART · đang làm · 3 công · Nguyễn Văn A
- 1.1.2 Đo nhiễu EMC · chưa làm · 2 công
```

Rồi nói thẳng việc cần sửa (gọi task bằng **số vị trí** hoặc **tên**):
> **Sửa task 1.1.2 dự án PHN: đổi tên thành "Đo nhiễu EMC lần 2", 4 mandays, ưu tiên cao**
> **Chuyển task 1.1.2 sang trạng thái đang làm**
> **Chuyển task 1.1.2 sang gói công việc 1.3**
> **Giao task 1.1.2 cho chị B làm chính (R) 60%** · **Gỡ anh C khỏi task 1.1.2**

Lưu ý:
- Chỉ field bạn nêu mới bị đổi, phần còn lại giữ nguyên.
- Rời trạng thái *chưa làm* cần task có đủ **ngày bắt đầu + kết thúc**.
- Huỷ task phải kèm **lý do**.
- Task thuộc **tháng đã đóng sổ** mà sửa công/ngày → phải nêu **lý do ≥10 ký tự** (ERP ghi lại vết).
- Một task chỉ được có **một người mang chữ A**.
- Sửa nhiều task cùng lúc → AI phải cho bạn xem danh sách thay đổi và **chờ bạn đồng ý** rồi mới chạy.

---

## 8. Gặp sự cố

| Hiện tượng | Cách xử lý |
|---|---|
| AI nói **không có công cụ ERP** | Chưa **khởi động lại** app sau khi cài/khai báo. Thoát hẳn rồi mở lại. |
| **Đăng nhập thất bại: Invalid credentials** | Sai email/mật khẩu. Đăng nhập lại (mật khẩu không hiện khi gõ là bình thường). |
| Dùng vài tuần rồi **báo hết phiên** | "Vé thông hành" hết hạn 30 ngày. Local: chạy lại `evs-erp-mcp login`. Web/CLI remote: kết nối lại. |
| macOS chặn **"không xác minh nhà phát triển"** | Chuột phải file → **Open** → **Open**. |
| Windows **"Windows protected your PC"** | **More info** → **Run anyway**. |
| **Không tạo được dự án** | Tài khoản không có quyền tạo dự án. Nhờ quản trị tạo, bạn tạo hạng mục/công việc bên trong. |
| Web connector không thêm được | ChatGPT: kiểm tra gói + "Developer mode". Đảm bảo địa chỉ đúng `https://mcp.evselab.com/mcp`. |

---

## 9. Cập nhật (chỉ bản cài trên máy)

**macOS**: `erp update` — nếu báo không có, dùng `~/.evs-erp-mcp/evs-erp-mcp update`
**Windows**: `"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" update`

Tự tải bản mới, không phải đăng nhập lại. Restart app sau khi update.
(Bản **remote/web** không cần cập nhật — máy chủ tự có bản mới.)

---

## 10. An toàn

- Bạn chỉ thao tác được đúng **quyền tài khoản ERP của mình** — không hơn.
- Không chia sẻ thư mục `~/.evs-erp-mcp` (macOS) / `%USERPROFILE%\.evs-erp-mcp` (Windows) — chứa "vé thông hành".
- Mọi thay đổi là **thật** trên ERP, hiện ngay cho cả nhóm. Kiểm tra kỹ trước khi tạo hàng loạt.
