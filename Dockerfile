FROM nginx:1.29-alpine-slim
# The deploy account's umask is 007, so the checkout is not world-readable;
# set modes here or nginx (user nginx) answers 403.
COPY --chmod=644 nginx.conf /etc/nginx/conf.d/default.conf
COPY --chmod=644 index.html /usr/share/nginx/html/index.html
EXPOSE 3000
