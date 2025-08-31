# Conduit RealWorld Example App – Dockerized Version

This is my Dockerized version of the [Conduit RealWorld Example App](https://github.com/TonyMckes/conduit-realworld-example-app.git),  
a fullstack project built with **React (Vite + SWC), Express.js, Sequelize, and PostgreSQL**.  

The original project demonstrates CRUD operations, authentication, routing, pagination, and more.  
My version focuses on **containerization, debugging, and deployment setup**.  

---

## 🔹 What I Did
- **Dockerized the application**: created Dockerfiles for frontend, backend, and database.  
- **Two setups provided**:
  - `with-docker-compose/` → all services orchestrated with Docker Compose.  
  - `without-docker-compose/` → manual multi-container setup (frontend, backend, DB).  
- **Database runtime and migration script**: ensured DB connection works without Compose.  
  *Database migrations are run automatically by the backend container’s entrypoint script when the container starts.*
- **Config fixes**:
  - Fixed `.env.example` misconfiguration (database was set to SQL instead of PostgreSQL).  
  - Corrected API URLs for Docker networking.  
- **Learning-focused restructuring**: adapted a monorepo/microservice-style codebase to a multi-container architecture.  

---

## 🔹 Tech Stack
- **Frontend**: React (Vite + SWC)  
- **Backend**: Express.js + Sequelize  
- **Database**: PostgreSQL  
- **Containerization**: Docker & Docker Compose  

---

# 🚀 Running the Project

You can run this project in two ways:  
1. [With Docker Compose](#-option-1-run-with-docker-compose) (recommended, easier)  
2. [Without Docker Compose](#-option-2-run-without-docker-compose) (manual setup for learning)  

---

## 🔹 Option 1: Run with Docker Compose

This is the easiest way to bring up the fullstack app (frontend + backend + PostgreSQL) with one command.

### Steps
1. Navigate to the `with-docker-compose` folder:
   ```bash
   cd with-docker-compose
    ```

2. Start all services:

   ```bash
   docker-compose up --build
   ```

3. Access the app:

   * Frontend: [http://localhost:3000](http://localhost:3000)
   * Backend API: [http://localhost:3001/api](http://localhost:3001/api)

4. Stop services:

   ```bash
   docker-compose down
   ```

---

## 🔹 Option 2: Run without Docker Compose

This method uses individual containers and Docker networking.
It’s useful for understanding how containers connect without an orchestration tool.

### Steps

1. Navigate to the `without-docker-compose` folder:

   ```bash
   cd without-docker-compose
   ```

2. Build Docker images:

   ```bash
   docker build -t conduit-frontend ./frontend
   docker build -t conduit-backend ./backend
   ```

### 3. Create network
```bash
docker network create conduit-network
```
### 4. Run containers

```bash
docker run -d --name db --network conduit-network --env-file backend/.env.example postgres
docker run -d -p 3001:3001 --name app --network conduit-network --env-file backend/.env.example conduit-backend
docker run -d -p 3000:3000 --name frontend-server --network conduit-network conduit-frontend
```

5. Access the app:

   * Frontend: [http://localhost:3000](http://localhost:3000)
   * Backend API: [http://localhost:3001/api](http://localhost:3001/api)

---

## 🔹 Notes

* Both methods (with and without Compose) achieve the same goal.
* Docker Compose is **simpler and closer to real-world deployment**, while the manual method is great for **learning container networking**.
* PostgreSQL data is persisted using a Docker volume (`pgdata`).

---

## 🔹 Original Project

This project is based on the [Conduit RealWorld Example App](https://github.com/TonyMckes/conduit-realworld-example-app.git).
I do not own the original project — this version is for **learning purposes and to showcase my Docker setup and fixes**.

