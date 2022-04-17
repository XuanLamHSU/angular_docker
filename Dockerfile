FROM node:latest as build-env
WORKDIR /app
COPY . /app
RUN npm install &&  npm install source-map-resolve && npm run build

FROM nginx:latest
COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-env /app/dist/angular_docker /usr/share/nginx/html

CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
