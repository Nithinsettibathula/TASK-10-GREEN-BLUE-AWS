FROM node:18-alpine

# Set environment to production
ENV NODE_ENV=production

# Create app directory
WORKDIR /opt/app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install --production

# Copy app source
COPY . .

# Build Strapi
RUN npm run build

# Expose port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]