# Use Node.js base image as Redocly CLI requires Node.js
FROM node:16-alpine

# Set working directory inside the container
WORKDIR /app

# Install Redocly CLI globally
RUN npm install -g @redocly/cli

# Copy project files to the container
COPY redocly.yaml .
COPY docs ./docs
COPY openapi ./openapi

# Expose the port for serving documentation
EXPOSE 8080

# Set the token directly as an environment variable
ENV REDOCLY_AUTH_TOKEN=sk_DtuLsrkUsiZY/eGXei8+G6SMfTA=_xb/MGSGLubk+GMHj8JU3hPDUXJlmgwHzCl4e3BdWUVI=

# Command to run Redocly and serve documentation
CMD ["sh", "-c", "redocly login --token $REDOCLY_AUTH_TOKEN && redocly preview-docs ./openapi/openapi.yaml --port 8080 --host 0.0.0.0 && rm -f /root/.redocly/credentials"]
