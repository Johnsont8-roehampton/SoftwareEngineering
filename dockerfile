# Use Node JS v16.x as base image
FROM node:latest

# this Creates the  server directory inside image
WORKDIR /app

# Copy the source code (src -> /app)
# node_modules directory is ignored via .dockerignore file
COPY . .

# this Installs the  dependencies (inside the container)
RUN npm install

# this is to Expose the server port that will connect the webpage
EXPOSE 3000

#this is the code that  Start server using npm script i will also iclude dev options
CMD [ "npm", "run", "start" ] 
