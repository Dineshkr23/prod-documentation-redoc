# Use Node.js base image as Redocly CLI requires Node.js
FROM node:16-alpine

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json for dependency installation
COPY package*.json ./

# Install all dependencies
RUN npm install -g @redocly/cli

# Copy the Redocly project files into the container
COPY . .

# Expose the port for serving documentation
EXPOSE 8080

# Command to run Redocly and serve documentation
CMD ["redocly", "preview-docs", "./openapi.yaml", "--port", "8080"]
