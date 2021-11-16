FROM nginx:1.17
COPY ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /code
COPY ./dist .
COPY ./libinstana_sensor.so /usr/local/lib/instana/libinstana_sensor.so
COPY ./ngx_http_opentracing_module.so /usr/lib/nginx/modules/ngx_http_opentracing_module.so
COPY ./instana-config.json /etc/instana-config.json
EXPOSE 8080:8080
CMD ["nginx", "-g", "daemon off;"]

