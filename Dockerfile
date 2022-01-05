#base 
FROM node:16-alpine as builder

#directory of use
WORKDIR '/app'

#copy package.json
COPY ./package.json ./

#add dependency
RUN npm install


#copy rest
COPY . . 
#we can also use COPY ./ ./

#run the server command
RUN npm run build

#ngnix block deployment

FROM nginx:1.15.2-alpine
COPY --from=builder /app/build /usr/share/nginx/html







