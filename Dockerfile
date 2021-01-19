#Build phase
FROM node:15-alpine
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

#Run Phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html