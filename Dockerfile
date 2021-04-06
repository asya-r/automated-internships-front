#FROM norp/create-elm-app
FROM node
RUN npm install -g serve
WORKDIR /app
COPY automated-internships-front /app
EXPOSE 5000
