# Sử dụng Node.js LTS làm base image
FROM node:18-alpine

# Đặt thư mục làm việc trong container
WORKDIR /app

# Copy package.json và package-lock.json vào container
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ mã nguồn vào container
COPY . .

# Mở port 3001 để truy cập ứng dụng
EXPOSE 5173

# Chạy ứng dụng React với Vite trong chế độ phát triển
CMD ["npm", "run", "dev"]