
#!/usr/bin/env bash
set -euo pipefail

# Start PostgreSQL
docker compose up -d

echo "🟡 - Waiting for database to be ready..."

# Wait until PostgreSQL accepts connections
until docker compose exec -T db pg_isready -U postgres -d integrate; do
  sleep 2
done

echo "🟢 - Database is ready!"

# Run Prisma migrations
npx prisma migrate deploy --config prisma7.config.ts

# Run tests
npm run test

# Stop containers
docker compose down
