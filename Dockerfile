
FROM node:18-alpine AS builder
WORKDIR /app
COPY . .

FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
