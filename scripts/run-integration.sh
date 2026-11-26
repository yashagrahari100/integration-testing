#!/usr/bin/env bash
set -euo pipefail
docker compose up -d
echo '🟡 - Waiting for database to be ready...'
bash ./scripts/wait-for-it.sh "postgresql://postgres:mypassword@localhost:5432/integrate" -- echo '🟢 - Database is ready!'
npx prisma migrate dev --name init
npm run test
docker-compose down