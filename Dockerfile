# Sử dụng Node.js >= 20 để tương thích react-router-dom
FROM node:20-alpine

# Đặt thư mục làm việc
WORKDIR /app

# Copy dependencies files trước để tận dụng layer cache
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ mã nguồn
COPY . .

# Mở port đúng với Vite (5173)
EXPOSE 5173

# Khởi chạy ứng dụng với Vite
CMD ["npm", "run", "dev"]
