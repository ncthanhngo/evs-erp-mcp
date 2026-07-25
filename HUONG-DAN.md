# Hướng dẫn dùng ERP trong trợ lý AI (Claude / ChatGPT / Gemini)

Tài liệu này giúp bạn kết nối trợ lý AI với **ERP Evselab**, để chỉ cần *gõ yêu cầu bằng tiếng Việt*
là AI tự tạo dự án, hạng mục, công việc thật trên ERP — không cần mở trình duyệt ERP.

> Làm **1 lần** (khoảng 5 phút), sau đó dùng hằng ngày rất nhanh.

---

## 0. Chọn cách dùng theo công cụ của bạn

Có **2 kiểu kết nối**:

- **Cài trên máy (local)** — tải 1 file nhỏ về máy. Dùng cho các app/CLI chạy trên máy.
- **Từ xa (remote)** — không cài gì, kết nối tới `https://mcp.evselab.com`. Dùng cho web.

| Bạn dùng | Kiểu | Xem mục |
|---|---|---|
| **Claude Desktop** (app) | Local | [1] cài + tự động xong |
| **ChatGPT web / ChatGPT desktop** | Remote | [4] |
| **Claude web (claude.ai)** | Remote | [4] |
| **Claude Code CLI** | Local hoặc Remote | [3a] |
| **Gemini CLI** | Local | [3b] |
| **OpenAI Codex CLI** | Local | [3c] |

> Không chắc? Nếu bạn xài **app ChatGPT hay claude.ai trên web** → dùng **Remote [4]**. Nếu xài **Claude Desktop** → dùng **[1]**.

---

## 1. Cài trên máy — Claude Desktop (dễ nhất)

### macOS
Mở **Terminal** (bấm `Cmd+dấu cách`, gõ `Terminal`, Enter), dán dòng này rồi Enter:
```bash
curl -fsSL https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.command -o ~/Downloads/install.command && bash ~/Downloads/install.command
```
> macOS chặn "nhà phát triển không xác minh"? Bấm chuột phải file → **Open** → **Open**.

### Windows
Tải [install.bat](https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.bat) → **bấm đúp**.
> Hiện "Windows protected your PC"? Bấm **More info** → **Run anyway**.

### Nhập tài khoản
Màn hình hỏi:
```
Email ERP:  ← gõ email ERP rồi Enter
Mật khẩu:   ← gõ mật khẩu (KHÔNG hiện ký tự — bình thường) rồi Enter
```
Thấy `OK — đã kết nối ...` là xong. **Thoát hẳn Claude Desktop (Cmd+Q / đóng) rồi mở lại.**

Installer tự cấu hình Claude Desktop giúp bạn. Không cần làm gì thêm → sang [mục 5](#5-kiểm-tra-đã-kết-nối-chưa).

---

## 2. Cài trên máy — bước chung cho CLI (Claude Code / Gemini / Codex)

Nếu bạn dùng **CLI** (không phải Claude Desktop), cài binary + đăng nhập trước:

**macOS** — chạy installer như [mục 1] (nó tải binary về `~/.evs-erp-mcp/`), hoặc chỉ đăng nhập:
```bash
~/.evs-erp-mcp/evs-erp-mcp login
```
**Windows**:
```
"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" login
```

Đường dẫn binary (dùng ở mục 3):
- macOS: `~/.evs-erp-mcp/evs-erp-mcp`
- Windows: `%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe`

---

## 3. Khai báo cho từng CLI

### 3a. Claude Code CLI
```bash
claude mcp add evs-erp -s user -- ~/.evs-erp-mcp/evs-erp-mcp
```
(Windows: thay đường dẫn bằng `%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe`.)

> Hoặc dùng **remote** (không cần cài binary) — xem [mục 4b].

### 3b. Gemini CLI
Thêm vào `~/.gemini/settings.json`:
```json
{
  "mcpServers": {
    "evs-erp": { "command": "/Users/BAN/.evs-erp-mcp/evs-erp-mcp" }
  }
}
```

### 3c. OpenAI Codex CLI
Thêm vào `~/.codex/config.toml`:
```toml
[mcp_servers.evs-erp]
command = "/Users/BAN/.evs-erp-mcp/evs-erp-mcp"
args = []
```

Xong → mở lại CLI → sang [mục 5](#5-kiểm-tra-đã-kết-nối-chưa).

---

## 4. Từ xa (không cài gì) — Web & CLI

Máy chủ chạy sẵn tại **`https://mcp.evselab.com`**.

### 4a. ChatGPT (web/desktop) và Claude web (claude.ai)
1. Vào phần thêm **Connector / MCP** của ứng dụng (Settings → Connectors).
2. Thêm connector mới, địa chỉ:
   ```
   https://mcp.evselab.com/mcp
   ```
3. Ứng dụng mở trang **đăng nhập ERP** → nhập email + mật khẩu ERP → cho phép.
4. Xong → sang [mục 5](#5-kiểm-tra-đã-kết-nối-chưa).

> ChatGPT: tính năng connector tùy **gói** (thường Plus/Pro/Team/Enterprise, có thể phải bật "Developer mode").

### 4b. Claude Code CLI dùng remote (thay vì cài binary)
Lấy token rồi khai báo:
```bash
# nếu đã có binary:
~/.evs-erp-mcp/evs-erp-mcp remote-login https://mcp.evselab.com
# → in ra sẵn lệnh:
claude mcp add evs-erp --transport http https://mcp.evselab.com/mcp --header "Authorization: Bearer <token>"
```

---

## 5. Kiểm tra đã kết nối chưa

Trong trợ lý, gõ thử:

> **Liệt kê các dự án của tôi trên ERP**

- ✅ **Đã kết nối**: trả về **danh sách dự án** (tên + mã). Lần đầu có thể hỏi cho phép dùng công cụ "evs-erp" → **Cho phép / Allow**.
- ❌ **Chưa kết nối**: nói "không có công cụ ERP" → xem [mục 9](#9-gặp-sự-cố).

---

## 6. Cách gọi nhanh: mã dự án + số vị trí

- Gọi **dự án** bằng **mã** (vd `PHN`), **tên viết tắt**, hoặc **tên đầy đủ**.
- Trong dự án, mọi thứ đánh **số thứ tự** (đếm từ 1, theo thứ tự hiển thị):
  - `1` = hạng mục (module) thứ 1
  - `1.1` = gói công việc (WP) thứ 1 trong hạng mục thứ 1

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

## 7. Việc thường dùng

### Chọn dự án
> **Chọn dự án PHN**

### Tạo hạng mục / gói công việc
> **Trong dự án PHN, tạo hạng mục "Firmware", rồi trong đó tạo gói công việc "Bring-up bo mạch"**

### Tạo dự án mới *(cần quyền)*
> **Tạo dự án mới tên "Nghiên cứu pin LFP", mã "LFP2026"**
> Thiếu quyền → AI báo lại, nhờ quản trị tạo hộ.

---

## 8. Chia việc lớn → nhiều task (mandays + RASCI + %)

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

## 9. Gặp sự cố

| Hiện tượng | Cách xử lý |
|---|---|
| AI nói **không có công cụ ERP** | Chưa **khởi động lại** app sau khi cài/khai báo. Thoát hẳn rồi mở lại. |
| **Đăng nhập thất bại: Invalid credentials** | Sai email/mật khẩu. Đăng nhập lại (mật khẩu không hiện khi gõ là bình thường). |
| Dùng vài tuần rồi **báo hết phiên** | "Vé thông hành" hết hạn 30 ngày. Local: chạy lại `evs-erp-mcp login`. Web: kết nối lại connector. |
| macOS chặn **"không xác minh nhà phát triển"** | Chuột phải file → **Open** → **Open**. |
| Windows **"Windows protected your PC"** | **More info** → **Run anyway**. |
| **Không tạo được dự án** | Tài khoản không có quyền tạo dự án. Nhờ quản trị tạo, bạn tạo hạng mục/công việc bên trong. |
| Web connector không thêm được | ChatGPT: kiểm tra gói + "Developer mode". Đảm bảo địa chỉ đúng `https://mcp.evselab.com/mcp`. |

---

## 10. Cập nhật (bản cài trên máy)

**macOS**: `erp update` — nếu báo không có, dùng `~/.evs-erp-mcp/evs-erp-mcp update`
**Windows**: `"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" update`

Tự tải bản mới, không phải đăng nhập lại. Restart app sau khi update.
(Bản **remote/web** không cần cập nhật — máy chủ tự có bản mới.)

---

## 11. An toàn

- Bạn chỉ thao tác được đúng **quyền tài khoản ERP của mình** — không hơn.
- Không chia sẻ thư mục `~/.evs-erp-mcp` (macOS) / `%USERPROFILE%\.evs-erp-mcp` (Windows) — chứa "vé thông hành".
- Mọi thay đổi là **thật** trên ERP, hiện ngay cho cả nhóm. Kiểm tra kỹ trước khi tạo hàng loạt.
