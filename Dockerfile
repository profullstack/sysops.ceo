FROM nginx:1.29-alpine-slim
# The deploy account's umask is 007, so the checkout is not world-readable;
# set modes here or nginx (user nginx) answers 403.
COPY --chmod=644 nginx.conf /etc/nginx/conf.d/default.conf
COPY --chmod=644 index.html /usr/share/nginx/html/index.html
COPY --chmod=644 .well-known/openwebring.json /usr/share/nginx/html/.well-known/openwebring.json
RUN chmod 755 /usr/share/nginx/html/.well-known
EXPOSE 3000
