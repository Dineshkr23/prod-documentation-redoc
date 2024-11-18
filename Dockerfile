# Use Node.js base image as Redocly CLI requires Node.js
FROM node:16-alpine

# Set working directory inside the container
WORKDIR /app

# Install Redocly CLI globally
RUN npm install -g @redocly/cli

# Copy the Redocly configuration file
COPY redocly.yaml .

# Copy the documentation files
COPY docs ./docs

# Copy the OpenAPI files
COPY openapi ./openapi

# Expose the port for serving documentation
EXPOSE 8080

# Command to run Redocly and serve documentation
CMD ["redocly", "preview-docs", "./openapi/openapi.yaml", "--port", "8080"]
