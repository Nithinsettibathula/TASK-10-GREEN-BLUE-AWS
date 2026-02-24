# Use the standard Node image (not alpine) for better compatibility
FROM node:18

# Set environment to production
ENV NODE_ENV=production

# Create app directory
WORKDIR /opt/app

# Copy package files from your subfolder
COPY my-project/package.json my-project/package-lock.json ./

# Clean npm cache and install dependencies
# We use --network-timeout to prevent errors if the connection is slow
RUN npm cache clean --force && \
    npm install --production --legacy-peer-deps --network-timeout=100000

# Copy the rest of your project files
COPY my-project/ .

# Build the Strapi admin panel
RUN npm run build

# Expose the Strapi port
EXPOSE 1337

# Start the application
CMD ["npm", "run", "start"]