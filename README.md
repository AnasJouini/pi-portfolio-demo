# Portfolio App README

This Portfolio project is an Angular application that can be run locally or containerized using Docker.

## Local Development

### Prerequisites
- Node.js (version 14 or higher)
- npm (Node Package Manager)

### Installation
Clone the repository:
- `git clone https://github.com/AnasJouini/pi-portfolio-demo`
- `cd pi-portfolio-demo`

Install dependencies:
`npm install`

### Running the Application
Build the Angular app:
`npm run build`

Start the development server:
`npm start`

Navigate to http://localhost:4200/ in your browser to view the application.

## Containerization

### 1. Building Docker Image
#### Prerequisites
- Docker installed on your machine

#### Steps
Build Docker image:
`docker build -t portfolio-app .`

This command builds a Docker image named portfolio-app using the Dockerfile in the current directory (.).

### 2. Running Docker Image
Run the Docker container:
`docker run -d -p 8080:80 portfolio-app`

The -d flag runs the container in detached mode, and -p 8080:80 maps port 8080 on the host to port 80 on the container.

Access the application at http://localhost:8080.

## Using Docker Compose

### Docker Compose File (docker-compose.yml)
Create a docker-compose.yml file in the project root:
version: '3.8'

services:
  angular-app:
    build: .
    ports:
      - "8080:80"

### Steps
Build and run containers:
`docker-compose up --build -d`

The --build flag ensures the image is rebuilt, and -d runs containers in detached mode.

View logs (optional):
`docker-compose logs -f`

Stop containers:
`docker-compose down`

This README provides a quick reference for setting up, running locally, and containerizing the portfolio Angular application using both Docker and Docker Compose.
