import { defineConfig } from "vite";
import path from 'path';

import react from "@vitejs/plugin-react-swc";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'), // Alias @ trỏ tới thư mục src
    },
  },
  server: {
    host: '::',  // Lắng nghe trên tất cả các IP
    port: 5173         // Đảm bảo sử dụng cổng 5173
  }
});
