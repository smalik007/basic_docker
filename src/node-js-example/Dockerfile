#pull latest node image
FROM node:latest

#This command lets you create a directory as /app (if it's already there, it will use it)
WORKDIR /app

# Add all the content from current directory to /app directory
ADD . .

# install dependencies
RUN npm install

# lets you run some user specific command 
CMD node index.js