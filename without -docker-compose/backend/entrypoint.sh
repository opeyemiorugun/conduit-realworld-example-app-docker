#!/bin/bash

# =========================
# entrypoint.sh
# =========================

# Wait for Postgres to be ready
echo "Waiting for Postgres..."
until nc -z "${DB_HOST:-db}" 5432; do
  sleep 1
done
echo "Postgres is up!"

# -------------------------
# Only attempt to create the database if in development
# -------------------------
echo "Attempting to create database..."
npm run sqlz -- db:create || echo "Database already exists, skipping db:create"
echo "Database is ready."

# -------------------------
# Always run migrations and seeds
# -------------------------
echo "Running migrations..."
npm run sqlz -- db:migrate

echo "Running seeds..."
npm run sqlz -- db:seed:all

# -------------------------
# Hand over control to CMD from Dockerfile
# -------------------------
exec "$@"
