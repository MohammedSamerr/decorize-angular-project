## stage1 > build angular app
FROM node:18.13.0 as builder

WORKDIR /app

COPY my-angular-app .


RUN npm install
RUN npm run build

## stage22
FROM nginx
COPY --from=builder /app/dist/my-angular-app/* usr/share/nginx/html/
EXPOSE 80