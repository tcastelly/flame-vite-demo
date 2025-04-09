import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  server: {
    port: '3535',
  },
  plugins: [
    tailwindcss(),
  ],
  build: {
    watch: {
      include: 'src/index.js'
    },
  }
});
