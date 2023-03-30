# Use the latest version of Node.js as of February 10th, 2023
FROM node:18.14.0

# Set the environment to development
ENV NODE_ENV=development

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

#server.js
COPY server.js .

# Expose port 8000
EXPOSE 8000

# Start the server
CMD ["node", "server.js"]
