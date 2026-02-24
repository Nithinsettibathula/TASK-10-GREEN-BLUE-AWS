FROM node:18-alpine

# Set environment to production
ENV NODE_ENV=production

# Create app directory
WORKDIR /opt/app

# Copy dependency files first
COPY my-project/package.json my-project/package-lock.json ./

# Install dependencies using 'npm install' with a legacy peer deps flag 
# to avoid common version conflicts
RUN npm install --production --legacy-peer-deps

# Copy all the source code
COPY my-project/ .

# Build Strapi
RUN npm run build

# Expose port
EXPOSE 1337

# Start Strapi
CMD ["npm", "run", "start"]