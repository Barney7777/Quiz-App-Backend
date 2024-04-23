# base image for the container
FROM node:18-alpine

# set as a working directory in the container
WORKDIR /app

# Package.json will be copied into the working directory of the container
COPY package*.json ./

# Install dependencies.
RUN npm install

# Copy files and folders with dependencies from the host machine to the container
COPY . ./

# Set the build argument directive
ARG MONGO_URI

# Set environment variables from .env file
ENV MONGO_URI=${MONGO_URI}

# Allow to port 8080 of the container
EXPOSE 3000

CMD ["npm", "run", "start"]

