# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx:1.17
COPY ./nginx.conf /etc/nginx/nginx.conf
WORKDIR /code
COPY --from=build-stage /app/dist .
COPY ./libinstana_sensor.so /usr/local/lib/instana/libinstana_sensor.so
COPY ./ngx_http_opentracing_module.so /usr/lib/nginx/modules/ngx_http_opentracing_module.so
COPY ./instana-config.json /etc/instana-config.json
COPY docker_entrypoint.sh .
COPY generate_env-config.sh .
RUN chmod 755 docker_entrypoint.sh generate_env-config.sh
EXPOSE 8080:8080

# CMD ["nginx", "-g", "daemon off;"]
CMD ["/bin/sh", "docker_entrypoint.sh"]
