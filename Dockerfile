# Use an official Node.js runtime as a parent image
FROM node:12-alpine

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install any necessary dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Define a command to start the application
CMD [ "node", "server.js" ]
