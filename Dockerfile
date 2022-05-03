FROM node:17-alpine as BUILD

WORKDIR '/app'

COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY --from=BUILD /app/dist /usr/share/nginx/html