FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM nginx:latest
COPY --from=build /app/dist/angular_docker /usr/share/nginx/html
