FROM node:14 as builder
WORKDIR /usr/src
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/build /usr/share/nginx/html
COPY conf /etc/nginx