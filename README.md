# Conduit RealWorld Example App – Dockerized Version

This is my Dockerized version of the [Conduit RealWorld Example App](https://github.com/gothinkster/realworld),  
a fullstack project built with **React, Express.js, Sequelize, and PostgreSQL**.  

The original project demonstrates CRUD operations, authentication, routing, pagination, and more.  
My version focuses on **containerization, debugging, and deployment setup**.  

---

## 🔹 What I Did
- **Dockerized the application**: created Dockerfiles for frontend, and backend.  
- **Multi-container setup**: instead of running everything in one container, I separated services into three connected containers without relying on Docker Compose.  
- **Database runtime script**: added a script to handle DB connection since Docker Compose wasn't used.  
- **Config fixes**:
  - Fixed `.env` misconfiguration (database was set to SQL instead of PostgreSQL).  
  - Corrected API URLs for Docker networking.  
- **Learning-focused restructuring**: adapted a monorepo/microservice-style codebase to a multi-container architecture for clarity and practice.  

---

## 🔹 Tech Stack
- **Frontend**: React (Vite + SWC)  
- **Backend**: Express.js + Sequelize  
- **Database**: PostgreSQL  
- **Containerization**: Docker  

---

## 🔹 Running the Project with Docker

### 1. Clone the repository
```bash
git clone https://github.com/opeyemiorugun/conduit-realworld-example-app-docker.git
cd conduit-realworld-example-app-docker
````

### 2. Build Docker images for frontend and backend

```bash
cd frontend
docker build . -t conduit-frontend 

cd ../backend
docker build . -t conduit-backend
cd ..
```
### 3. Create network
```bash
docker network create conduit_network
```
### 3. Run containers

```bash
docker run -d --name db --network conduit_network --env-file backend/.env.example postgres
docker run -d -p 3001:3001 --name app --network conduit-network --env-file backend/.env.example conduit-backend
docker run -d -p 3000:3000 --name frontend-server --network conduit-network conduit-frontend
```

### 4. Access the app

* Frontend: [http://localhost:3000](http://localhost:3000)
* Backend API: [http://localhost:3001/api](http://localhost:3001/api)

---

## 🔹 Notes

* This setup avoids Docker Compose intentionally — the runtime script handles DB connections directly and container network is setup manually.
* Useful for understanding **manual container orchestration and networking**.

---

## 🔹 Original Project

This project is based on the [Conduit RealWorld Example App](https://github.com/TonyMckes/conduit-realworld-example-app.git).
I do not own the original project — this version is for **learning purposes and to showcase my Docker setup and fixes**.

---

