# Use the official Node.js image as the base image
FROM node:16.14.0-alpine 
# If you're using M1, M2 Mac, try this: 
# FROM  --platform=linux/amd64 node:16.14.0-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY FUC-ftp-server/package*.json ./

# Install dependencies
RUN npm install pm2 -g
RUN npm install --quiet

# Copy the application files
#COPY FUC-ftp-server/ .

# Expose the port
EXPOSE 80

# Start the application
CMD [ "npm", "start" ]