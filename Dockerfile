#stage 1
# FROM node:latest as node
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod
# #stage 2
# FROM nginx:alpine
# COPY --from=node /app/dist/testing-docker /usr/share/nginx/html



# #stage 1
# FROM node:latest as node
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod
# #stage 2
# FROM nginx:alpine
# COPY --from=node /app/dist/demo-app /usr/share/nginx/html


# FROM node:12.7-alpine AS build
# WORKDIR /src/app
# COPY package.json package-lock.json ./
# RUN npm install
# COPY . .
# RUN npm run build
# ### STAGE 2: Run ###
# FROM nginx:1.17.1-alpine
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY --from=build /src/app/dist/aston-villa-app /usr/share/nginx/html


#  ### STAGE 1: Build ###
#     FROM node:12.22-alpine3.10 AS build
#     WORKDIR /usr/src/app
#     COPY package.json package-lock.json ./
#     RUN npm i -g @angular/cli

#     # Install app dependencies:
#     RUN npm i

#     COPY . .
#     RUN ng build --prod
#     ### STAGE 2: Run ###
#     FROM nginx:1.17.1-alpine
#     COPY nginx.conf /etc/nginx/nginx.conf
#     COPY --from=build /usr/src/app/dist/*

# # Stage 1
# FROM node:14.15.4 as node
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm run build --prod
# # Stage 2
# FROM nginx:1.15.8-alpine
# COPY --from=node /app/dist/angular-app /usr/share/nginx/html



#stage 1
FROM node:14.0.0-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:1.15.8-alpine
COPY --from=builder /app/dist/app /usr/share/nginx/html
