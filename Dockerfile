FROM node:18

# Install dependencies
RUN apt-get update && apt-get install libvips-dev -y

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt/

# Copy correct dependency files
COPY package.json package-lock.json ./

# Install npm dependencies with increased network timeout
RUN npm install && npm install mysql2
WORKDIR /opt/apt

# Copy all project files
COPY . .

# Build the application
RUN npm run build

EXPOSE 1337

CMD [ "npm", "run", "develop" ]
