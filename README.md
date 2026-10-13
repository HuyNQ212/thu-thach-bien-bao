# Thử thách biển báo – Hình có trục đối xứng (Toán 6)

Website gồm **Giáo viên** và **Học sinh**, dùng **Cloudflare Workers + D1**.

## Chức năng
- Giáo viên đăng nhập bằng mật khẩu bí mật, tạo một mã phòng mới cho mỗi buổi.
- Sao chép link gửi học sinh (link tự điền mã phòng).
- Học sinh nhập họ tên, vẽ các trục đối xứng và chọn số trục của 4 biển báo.
- Bài làm lưu trên D1, bảng giáo viên cập nhật mỗi 6 giây.
- GV khóa bài và công bố kết quả riêng; HS chỉ kiểm tra khi đã công bố.
- GV xem tiến độ và xuất CSV.

## Triển khai
Database D1 **thu-thach-bien-bao-db** đã được tạo và ID gắn trong `wrangler.toml`.

```bash
npm install
npx wrangler login
npm run db:remote
npx wrangler secret put TEACHER_PASSWORD
npm run deploy
```

**Không đưa mật khẩu giáo viên vào GitHub.** Nếu liên kết Workers Builds với GitHub, cần cấu hình binding D1 và secret trong Cloudflare Dashboard cho Worker. Đảm bảo thư mục assets là `./public`.

## Lưu ý
- Mã phòng 6 ký tự, mỗi lần tạo mới.
- Link HS: `https://<worker-domain>/?room=<MÃ_PHÒNG>`.
- Có thể dùng GitHub trong Workers Builds để tự động deploy nhánh main.
- Hình biển báo hiện là minh họa SVG trong HTML; thay bằng file ảnh gốc PNG nếu muốn khớp chính xác bộ ảnh dạy học.
- Giữ kín link/mật khẩu GV. Chưa áp dụng bảo vệ dữ liệu cá nhân cấp sản phẩm thương mại.
