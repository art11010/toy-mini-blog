# build stage
FROM node:18 as build-stage
WORKDIR /app
COPY package*.json ./
RUN yarn install  # Yarn으로 패키지 설치
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/build /usr/share/nginx/html

# copy the custom nginx configuration file (if you have one)
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
