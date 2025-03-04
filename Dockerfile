# Base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files first (for better caching)
COPY dockeractividad/package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY dockeractividad/ .

# Build the Next.js application
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"] 