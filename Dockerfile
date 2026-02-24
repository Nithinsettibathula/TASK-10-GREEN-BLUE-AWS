# Use Node.js 18 on Alpine Linux for a small image size
FROM node:18-alpine

# Set the environment to production
ENV NODE_ENV=production

# Create and set the working directory inside the container
WORKDIR /opt/app

# Copy the dependency files from the 'my-project' subfolder
COPY my-project/package.json my-project/package-lock.json ./

# Install only production dependencies
RUN npm install --production

# Copy all the source code from the 'my-project' subfolder to the container
COPY my-project/ .

# Build the Strapi admin panel and project
RUN npm run build

# Expose the default Strapi port
EXPOSE 1337

# Start the Strapi application
CMD ["npm", "run", "start"]