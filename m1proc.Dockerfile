FROM node
RUN npm install -g serve
WORKDIR /app
COPY automated-internships-front /app
