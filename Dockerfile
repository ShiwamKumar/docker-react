FROM node:14 as builder
WORKDIR /usr/src
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80 
COPY --from=builder usr/src/build /usr/share/nginx/html