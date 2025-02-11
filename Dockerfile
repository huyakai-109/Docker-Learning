FROM node:22.13.1-slim
RUN npm install -g @angular/cli@19.1.5

RUN addgroup app && useradd -m -g app app
WORKDIR /app
COPY ["package*.json", "./"]
RUN npm install
COPY . . 

RUN chown -R app:app /app
USER app

ENV API_PATH=http://api.localhost
EXPOSE 4200
#CMD [ "npm", "start" ]
ENTRYPOINT [ "ng","serve", "--host", "0.0.0.0", "--disable-host-check" ]