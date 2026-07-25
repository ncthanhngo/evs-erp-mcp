# Hướng dẫn dùng ERP trong Claude Desktop (cho người mới)

Tài liệu này giúp bạn kết nối **Claude Desktop** với **ERP Evselab**, để bạn chỉ cần *gõ yêu cầu bằng tiếng Việt* là Claude tự tạo dự án, hạng mục và công việc thật trên ERP — không cần mở trình duyệt, không cần biết kỹ thuật.

> Toàn bộ quá trình chỉ làm **1 lần** (khoảng 5 phút). Sau đó dùng hằng ngày rất nhanh.

---

## Mục lục
1. [Cần chuẩn bị gì](#1-cần-chuẩn-bị-gì)
2. [Cài đặt trên macOS](#2-cài-đặt-trên-macos)
3. [Cài đặt trên Windows](#3-cài-đặt-trên-windows)
4. [Đăng nhập tài khoản ERP](#4-đăng-nhập-tài-khoản-erp)
5. [Kiểm tra đã kết nối thành công chưa](#5-kiểm-tra-đã-kết-nối-thành-công-chưa)
6. [Bắt đầu sử dụng](#6-bắt-đầu-sử-dụng)
7. [Tạo task hàng loạt](#7-tạo-task-hàng-loạt)
8. [Cập nhật phiên bản mới](#8-cập-nhật-phiên-bản-mới)
9. [Gặp sự cố? Xem đây](#9-gặp-sự-cố-xem-đây)

---

## 1. Cần chuẩn bị gì

- **Máy tính** macOS hoặc Windows.
- **Claude Desktop** đã cài sẵn. Chưa có thì tải ở: https://claude.ai/download (cài như phần mềm bình thường, đăng nhập tài khoản Claude của bạn).
- **Tài khoản ERP Evselab** (email + mật khẩu bạn vẫn dùng để đăng nhập web ERP).

Vậy là đủ. Bạn **không cần** cài thêm gì khác — file cài đặt sẽ tự lo.

---

## 2. Cài đặt trên macOS

**Cách dễ nhất — dùng Terminal (khuyên dùng):**

1. Mở ứng dụng **Terminal** (bấm `Cmd + dấu cách`, gõ `Terminal`, Enter).
2. Sao chép nguyên dòng dưới đây, dán vào Terminal, bấm **Enter**:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.command -o ~/Downloads/install.command && bash ~/Downloads/install.command
   ```

3. Chờ vài giây, màn hình sẽ hỏi email và mật khẩu → chuyển sang [mục 4](#4-đăng-nhập-tài-khoản-erp).

> **Nếu bạn thích bấm chuột hơn:** tải file [install.command](https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.command) về máy. Khi mở lần đầu macOS có thể báo *"không xác minh được nhà phát triển"*. Cách xử lý: **bấm chuột phải vào file → chọn Open → bấm Open lần nữa**. (Chỉ cần làm vậy lần đầu.)

---

## 3. Cài đặt trên Windows

1. Tải file cài đặt: [install.bat](https://raw.githubusercontent.com/ncthanhngo/evs-erp-mcp/main/install.bat)
   *(Nếu trình duyệt hỏi "giữ lại file?" → chọn Giữ / Keep.)*
2. Vào thư mục **Downloads**, **bấm đúp** vào `install.bat`.
3. Nếu hiện bảng xanh **"Windows protected your PC"**:
   - Bấm dòng chữ nhỏ **More info**
   - Rồi bấm nút **Run anyway**.
4. Cửa sổ đen hiện ra và hỏi email + mật khẩu → chuyển sang [mục 4](#4-đăng-nhập-tài-khoản-erp).

---

## 4. Đăng nhập tài khoản ERP

Sau khi chạy file cài đặt, màn hình sẽ lần lượt hỏi:

```
Email ERP:  ← gõ email ERP của bạn rồi Enter
Mật khẩu:   ← gõ mật khẩu (sẽ KHÔNG hiện ký tự, cứ gõ rồi Enter)
```

> Lúc gõ mật khẩu **màn hình không hiện gì cả** — đó là bình thường (để bảo mật). Cứ gõ đúng rồi Enter.

Nếu đúng, bạn sẽ thấy dòng:

```
OK — đã kết nối your.email@evselab.com.
Đã cấu hình Claude Desktop: ...
Khởi động lại Claude Desktop để dùng.
```

👉 **Quan trọng:** hãy **thoát hẳn Claude Desktop rồi mở lại** (macOS: `Cmd + Q` rồi mở lại; Windows: đóng cửa sổ và mở lại từ menu Start).

- Mật khẩu **không** bị lưu ở đâu cả. Chỉ lưu một "vé thông hành" tự động hết hạn sau 30 ngày.

---

## 5. Kiểm tra đã kết nối thành công chưa

Mở Claude Desktop, tạo một đoạn chat mới và gõ thử:

> **Liệt kê các dự án của tôi trên ERP**

- ✅ **Đã kết nối**: Claude trả về **danh sách dự án** của bạn (tên + mã dự án). Lần đầu Claude có thể hỏi bạn cho phép dùng công cụ "evs-erp" → bấm **Cho phép / Allow**.
- ❌ **Chưa kết nối**: Claude nói kiểu "tôi không có công cụ để xem ERP" → xem [mục 9](#9-gặp-sự-cố-xem-đây).

> Mẹo: trong ô soạn tin của Claude Desktop có biểu tượng công cụ (hình ổ cắm / cái búa). Bấm vào sẽ thấy nhóm **evs-erp** với các công cụ như *evs_list_projects, evs_create_task*… Thấy nghĩa là đã kết nối.

---

## 6. Bắt đầu sử dụng

Bạn **không cần nhớ lệnh kỹ thuật**. Cứ nói chuyện bình thường bằng tiếng Việt. Dưới đây là các việc hay dùng.

### 6.1. Chọn dự án để làm việc
Vì bạn có thể có nhiều dự án, hãy chọn 1 dự án trước. Gọi bằng **mã dự án**, **tên viết tắt** hoặc **tên đầy đủ**:

> **Chọn dự án PHN**

Claude sẽ ghi nhớ dự án này cho các thao tác tiếp theo.

### 6.2. Tạo dự án mới *(cần quyền)*
> **Tạo dự án mới tên "Nghiên cứu pin LFP", mã "LFP2026"**

- Nếu tài khoản bạn **không có quyền tạo dự án**, Claude sẽ báo lại rõ ràng. Khi đó nhờ quản trị tạo hộ, rồi bạn chỉ tạo hạng mục/công việc bên trong.

### 6.3. Cấu trúc trong một dự án
ERP tổ chức theo 3 tầng, từ lớn đến nhỏ:

```
Dự án (Project)
 └─ Hạng mục (Module)
     └─ Gói công việc (Work Package / WP)
         └─ Công việc (Task)   ← thứ bạn tạo nhiều nhất
```

### 6.4. Cách gọi tắt theo số vị trí
Trong dự án, mọi thứ được đánh **số thứ tự** để gọi cho nhanh (đếm từ 1, theo thứ tự hiển thị):

- `1` = hạng mục (module) thứ 1
- `1.1` = gói công việc thứ 1 **trong** hạng mục thứ 1
- `1.2` = gói công việc thứ 2 trong hạng mục thứ 1

Nhờ vậy bạn chỉ cần nói: *"tạo task trong **1.1** dự án **PHN**"* là đủ.

### 6.5. Xem cây dự án (kèm số vị trí)
> **Xem cấu trúc dự án PHN**

Claude hiện dạng:
```
1. Cơ khí
   1.1 Khung xe
   1.2 Vỏ máy
2. Điện
   2.1 Mạch nguồn
```

### 6.6. Tạo hạng mục và gói công việc
> **Trong dự án PHN, tạo hạng mục "Firmware", rồi trong hạng mục đó tạo gói công việc "Bring-up bo mạch"**

---

## 7. Tạo task hàng loạt

Đây là phần mạnh nhất. Bạn liệt kê nhiều việc một lần, Claude tạo hết.

### 7.1. Thêm nhiều task vào một WP **đã có sẵn** (theo số vị trí)
Xem cây để biết số vị trí (mục 6.5), rồi chỉ cần nói vị trí:

> **Trong dự án PHN, work package 1.1, tạo giúp tôi các công việc sau, mỗi dòng một task:**
> - Kiểm tra nguồn 3V3 và 5V
> - Nạp firmware thử nghiệm
> - Đo dạng sóng UART
> - Viết báo cáo bring-up

Claude sẽ tạo lần lượt vào đúng WP `1.1` và báo lại từng task đã tạo.

> Nếu bạn nói vị trí chưa tồn tại (vd `1.5` mà module 1 chưa có WP thứ 5), Claude sẽ báo rõ và gợi ý tạo WP mới kèm tên.

### 7.2. Vừa tạo WP mới **vừa** đổ task vào
Nếu WP chưa tồn tại, gộp luôn trong một yêu cầu:

> **Trong dự án đang chọn, tạo hạng mục "Kiểm thử", trong đó tạo gói công việc "Test EMC", rồi thêm các công việc:**
> - Chuẩn bị mẫu đo
> - Đo phát xạ bức xạ
> - Đo miễn nhiễm
> - Tổng hợp kết quả

### 7.3. Chia việc lớn → nhiều task kèm mô tả, mandays, RASCI, %
Đây là cách dùng mạnh nhất. Bạn mô tả **một công việc lớn**, để Claude tự chia nhỏ và tạo hàng loạt.

Ví dụ:

> **Tôi cần làm bộ nguồn 3kW. Hãy chia thành các task chi tiết, mỗi task ghi mô tả, số mandays,
> và giao RASCI: thiết kế mạch giao anh A làm chính (R) 80%, chị B kiểm tra (C); layout PCB anh C (R).
> Sau đó tạo tất cả vào work package 1.1 dự án PHN.**

Claude sẽ:
1. Nghĩ ra ~10 task kèm mô tả + mandays + ai giữ vai trò gì (RASCI) + % effort.
2. **Cho bạn xem trước danh sách** — bạn đọc, chỉnh nếu cần.
3. Khi bạn đồng ý, tạo lần lượt vào `1.1`.

**Về RASCI** (vai trò trong task):
- **R** = Người làm chính · **A** = Người chịu trách nhiệm duyệt · **S** = Hỗ trợ · **C** = Được hỏi ý kiến · **I** = Được thông báo.
- Mỗi người có thể mang nhiều chữ (vd `AR`), kèm **% effort** người đó hưởng.
- Người được giao **tự động được thêm vào thành viên dự án** (không cần thêm tay trước).

**Về người**: gọi bằng **tên**, **mã nhân viên** hoặc **email**. Nếu trùng tên, Claude sẽ hỏi lại cho rõ.
Muốn xem danh sách: *"liệt kê nhân sự"*.

**Về mandays**: là số ngày công của task. Bạn nói *"task này 3 mandays"* là được.

> Không nêu người → task giao cho **chính bạn**, ưu tiên **trung bình** (mặc định).

---

## 8. Cập nhật phiên bản mới

Khi có bản mới, bạn tự cập nhật rất nhanh (không phải đăng nhập lại):

**macOS** — mở Terminal, gõ:
```bash
erp update
```
Nếu báo "command not found", dùng dòng đầy đủ:
```bash
~/.evs-erp-mcp/evs-erp-mcp update
```

**Windows** — mở Command Prompt, dán:
```
"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" update
```

Sau khi cập nhật, **khởi động lại Claude Desktop**.

---

## 9. Gặp sự cố? Xem đây

| Hiện tượng | Cách xử lý |
|---|---|
| Claude nói **không có công cụ ERP** | Bạn chưa **khởi động lại** Claude Desktop sau khi cài. Thoát hẳn (Cmd+Q / đóng cửa sổ) rồi mở lại. |
| **Đăng nhập thất bại: Invalid credentials** | Sai email hoặc mật khẩu. Chạy lại file cài đặt và nhập cẩn thận (mật khẩu không hiện khi gõ là bình thường). |
| Dùng được vài tuần rồi **báo hết phiên** | "Vé thông hành" hết hạn sau 30 ngày. Đăng nhập lại: macOS `~/.evs-erp-mcp/evs-erp-mcp login`, Windows `"%USERPROFILE%\.evs-erp-mcp\evs-erp-mcp.exe" login`. |
| macOS chặn **"không xác minh nhà phát triển"** | Bấm chuột phải file → **Open** → **Open**. Chỉ cần lần đầu. |
| Windows hiện **"Windows protected your PC"** | Bấm **More info** → **Run anyway**. |
| **Không tạo được dự án** | Tài khoản của bạn không có quyền tạo dự án. Nhờ quản trị tạo dự án, bạn tạo hạng mục/công việc bên trong. |
| Tạo task báo lỗi | Chụp lại câu Claude trả về gửi cho người phụ trách kỹ thuật để chỉnh. |

---

## Lưu ý an toàn

- Bạn chỉ thao tác được đúng những gì **tài khoản ERP của bạn được phép** — không hơn.
- Không chia sẻ thư mục `~/.evs-erp-mcp` (macOS) hay `%USERPROFILE%\.evs-erp-mcp` (Windows) cho người khác — nó chứa "vé thông hành" của bạn.
- Mọi thay đổi (tạo dự án/hạng mục/công việc) là **thật** trên ERP, hiển thị ngay cho cả nhóm. Hãy kiểm tra lại trước khi tạo hàng loạt.
