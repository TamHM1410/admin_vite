# Sử dụng image Node.js chính thức
FROM node:18 AS build

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy package.json và package-lock.json (nếu có) vào container
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Build ứng dụng React
RUN npm run build

# Cài đặt một server đơn giản để phục vụ ứng dụng React (sử dụng serve)
FROM nginx:alpine

# Copy build từ bước trước vào thư mục mặc định của Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Mở port 5173
EXPOSE 5173

# Chạy Nginx
CMD ["nginx", "-g", "daemon off;"]
