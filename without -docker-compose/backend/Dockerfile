FROM node:18.12

WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y netcat-openbsd && rm -rf /var/lib/apt/lists/*

COPY package*.json .

RUN npm install 

COPY . .

RUN chmod +x ./entrypoint.sh

EXPOSE 3001

ENTRYPOINT [ "./entrypoint.sh" ] 

CMD ["npm", "run", "start"]