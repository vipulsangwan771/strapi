FROM node:18

# Install system dependencies for Strapi
RUN apt-get update && apt-get install -y libvips-dev

# Set working directory
WORKDIR /opt/app

# Copy package.json and install dependencies
COPY package.json package-lock.json ./
RUN npm install --production && npm install mysql2

# Copy application files
COPY . .

# Set environment variables
# ENV NODE_ENV=production
# ENV PORT=1337
# ENV HOST=0.0.0.0

# Build Strapi app
RUN npm run build

# Expose port 8080 for Cloud Run
EXPOSE 1337

# Start the server (use start instead of develop)
CMD ["npm", "run", "start"]
