# Stage 1: Build the Angular app
FROM node:14-alpine AS build

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Build the Angular app
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:1.17.1-alpine

# Copy the custom Nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the built Angular app from the previous stage
COPY --from=build /app/dist/portfolio-angular /usr/share/nginx/html

# Expose port 8080
EXPOSE 8080

# Update Nginx to listen on port 8080
RUN sed -i 's/listen 80;/listen 8080;/' /etc/nginx/conf.d/default.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
