# ThesisMind Web：一个装着静态页面的 nginx。
#   docker build -t thesismind-web .
#   docker run -d --name thesismind-web -p 8080:80 -v "$PWD/dist/config.js:/usr/share/nginx/html/config.js:ro" thesismind-web
# 容器只开 80 端口，https 交给前面的反向代理或 CDN。
FROM nginx:1.27-alpine
COPY deploy/nginx.docker.conf /etc/nginx/conf.d/default.conf
COPY dist/ /usr/share/nginx/html/
EXPOSE 80
