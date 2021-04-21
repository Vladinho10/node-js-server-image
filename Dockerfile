FROM node:12

# Create my-app directory
WORKDIR /usr/src/my-app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

# run node index.js in container
CMD [ "node", "index.js" ]
