# Step 1: Use Node 18 Alpine as the base
FROM node:18-alpine

# Step 2: Install build essentials (Required for Strapi on Alpine)
RUN apk add --no-cache build-base gcc autoconf automake libtool zlib-dev libpng-dev nasm python3

# Step 3: Set working directory
WORKDIR /opt/app

# Step 4: Copy package files from my-project
# Ensure these files exist in your 'my-project' folder
COPY my-project/package.json my-project/package-lock.json ./

# Step 5: Install dependencies
RUN npm install

# Step 6: Copy the rest of the app
COPY my-project/ .

# Step 7: Build for production
RUN npm run build

# Step 8: Expose port 1337
EXPOSE 1337

CMD ["npm", "run", "start"]