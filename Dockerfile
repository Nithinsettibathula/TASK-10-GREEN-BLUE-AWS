FROM node:18-alpine

# Set environment to production
ENV NODE_ENV=production

# Create app directory
WORKDIR /opt/app

# Copy only the package.json first
COPY my-project/package.json ./

# Install dependencies ignoring the lock file to bypass the previous errors
RUN npm install --production --no-package-lock --legacy-peer-deps

# Now copy the rest of the project
COPY my-project/ .

# Build Strapi
RUN npm run build

# Expose the port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]