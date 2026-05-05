# Ứng Dụng Ghi Chú Đơn Giản (Simple Note App)

Ứng dụng di động Flutter cho phép người dùng tạo, chỉnh sửa và quản lý ghi chú cá nhân với khả năng lưu trữ cục bộ bằng SQLite. Được xây dựng trong khuôn khổ **Lab 5 – Flutter Libraries & Native Code**.

---

## Mô Tả & Tính Năng

- **Tạo ghi chú** với tiêu đề và nội dung
- **Xem danh sách ghi chú** được sắp xếp theo thời gian mới nhất
- **Chỉnh sửa ghi chú** thông qua màn hình chỉnh sửa riêng biệt
- **Xóa ghi chú** kèm hộp thoại xác nhận để tránh xóa nhầm
- **Lưu trữ cục bộ** bằng SQLite — dữ liệu được giữ nguyên giữa các phiên
- **Hiển thị thời gian** tạo ghi chú theo định dạng dd/MM/yyyy HH:mm

---

## Sơ Đồ Kiến Trúc

```
simple_note_app/
└── lib/
    ├── main.dart                    ← Điểm khởi chạy app, cấu hình ChangeNotifierProvider
    │
    ├── models/
    │   └── note.dart                ← Model dữ liệu (id, title, content, createdAt)
    │
    ├── database/
    │   └── db_helper.dart           ← Singleton SQLite helper (thao tác CRUD)
    │
    ├── providers/
    │   └── note_provider.dart       ← Quản lý trạng thái với ChangeNotifier
    │
    ├── screens/
    │   ├── home_page.dart           ← Màn hình chính: danh sách + nút thêm
    │   └── note_editor_screen.dart  ← Màn hình thêm / chỉnh sửa ghi chú
    │
    └── widgets/
        └── note_card.dart           ← Widget card hiển thị tiêu đề, nội dung, thời gian
```

### Luồng Dữ Liệu

```
Giao diện (Screens / Widgets)
            │
            ▼
  NoteProvider (ChangeNotifier)
            │
            ▼
    DbHelper (Singleton)
            │
            ▼
  Cơ sở dữ liệu SQLite (notes.db)
```

---

## Hướng Dẫn Chạy Dự Án

### Yêu Cầu

- Flutter SDK `^3.11.5`
- Dart SDK `^3.11.5`
- Android Studio hoặc VS Code có cài plugin Flutter & Dart
- Android Emulator (khuyến nghị Pixel 5 API 36) hoặc thiết bị Android thật

> **Lưu ý:** Ứng dụng sử dụng `sqflite` — **không hỗ trợ Flutter Web**. Vui lòng chạy trên Android.

### Các Bước Thực Hiện

```bash
# 1. Tải về hoặc clone dự án
git clone https://github.com/your-username/simple_note_app.git
cd simple_note_app

# 2. Cài đặt các package phụ thuộc
flutter pub get

# 3. Chạy ứng dụng trên thiết bị/máy ảo Android
flutter run -d android
```

---

## Công Nghệ Sử Dụng

| Package | Phiên bản | Mục đích |
|---|---|---|
| `sqflite` | ^2.3.3+1 | Cơ sở dữ liệu SQLite cục bộ để lưu ghi chú |
| `path` | ^1.9.1 | Tạo đường dẫn file cho vị trí database |
| `path_provider` | ^2.1.3 | Truy cập thư mục hệ thống của thiết bị |
| `provider` | ^6.1.2 | Quản lý trạng thái theo mô hình ChangeNotifier |
| `intl` | ^0.19.0 | Định dạng ngày giờ cho timestamp |
| `flutter` | SDK | Framework xây dựng giao diện |

---

## Hạn Chế Hiện Tại

- **Chỉ hỗ trợ Android** — `sqflite` không chạy được trên Flutter Web hoặc Desktop nếu không có package bổ sung
- **Không có tính năng tìm kiếm** — người dùng không thể lọc ghi chú theo từ khóa
- **Không có phân loại** — tất cả ghi chú nằm trong một danh sách chung, không có thư mục hay nhãn
- **Chỉ hỗ trợ văn bản thuần** — không có định dạng in đậm, in nghiêng hay markdown
- **Không đính kèm hình ảnh** — nội dung ghi chú chỉ là chữ
- **Không có tính năng hoàn tác** — ghi chú bị xóa không thể khôi phục

---

## Hướng Phát Triển Trong Tương Lai

- **Tìm kiếm & lọc** — thêm thanh tìm kiếm để lọc ghi chú theo tiêu đề hoặc nội dung
- **Phân loại / Nhãn** — tổ chức ghi chú vào thư mục hoặc gắn nhãn
- **Chế độ tối** — hỗ trợ dark mode / light mode
- **Ghim ghi chú quan trọng** — giữ ghi chú thường dùng ở đầu danh sách
- **Nhắc nhở** — đặt thông báo cục bộ cho ghi chú có thời hạn
- **Đính kèm hình ảnh** — chụp ảnh hoặc chọn từ thư viện để gắn vào ghi chú
- **Đồng bộ đám mây** — sao lưu và đồng bộ dữ liệu qua Firebase
- **Khóa ghi chú** — bảo vệ ghi chú riêng tư bằng mã PIN hoặc vân tay
- **Xuất ghi chú** — export ghi chú dưới dạng PDF hoặc file văn bản
- **Đa nền tảng** — mở rộng hỗ trợ iOS, Web và Desktop với `sqflite_common_ffi`
