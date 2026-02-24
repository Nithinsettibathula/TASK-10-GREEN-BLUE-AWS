# Step 1: Base image
FROM node:18-alpine

# Step 2: Set working directory inside the container
WORKDIR /opt/app

# Step 3: Copy package files from your specific project folder
COPY my-project/package.json my-project/package-lock.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code from my-project
COPY my-project/ .

# Step 6: Build the Strapi project
RUN npm run build

# Step 7: Expose port 1337 and start the app
EXPOSE 1337
CMD ["npm", "run", "start"]