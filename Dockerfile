# Step 1: Use the official Strapi image that already has everything ready
FROM strapi/strapi:latest

# Step 2: Set the working directory
WORKDIR /opt/app

# Step 3: Copy your project files into the container
# We copy 'my-project' content directly to /opt/app
COPY my-project/ .

# Step 4: Build the admin panel
RUN npm run build

# Step 5: Expose the port
EXPOSE 1337

# Step 6: Start the app
CMD ["npm", "run", "start"]