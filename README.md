# Redis Performance and Scalability Lab

This project provides a minimal Redis setup with persistence enabled and a small metrics backup script to capture key Redis INFO sections. It is intended for local experiments around performance, memory usage, and keyspace behavior.

## What is included

- Redis container with password authentication and AOF enabled
- Data volume mounted at `./dados` for persistence
- `backup_metrics.sh` script to snapshot `INFO memory`, `INFO stats`, and `INFO keyspace`

## Requirements

- Docker Engine
- Docker Compose v2 (`docker compose`)

## Quick start

Copy the environment template and set your password:

```bash
cp .env.example .env
```

Start Redis:

```bash
docker compose up -d
```

Connect with `redis-cli`:

```bash
redis-cli -a "$REDIS_PASSWORD"
```

Stop services:

```bash
docker compose down
```

## Metrics backup

Inside the container, run:

```bash
/data/backup_metrics.sh
```

Backups are stored under:

```
./dados/stats/<YYYY_MM_DD_HH_MM_SS>/
```

## Data persistence

Redis persistence is stored in `./dados`, including AOF files and snapshots. These are ignored by git via `.gitignore`.

## Security note

The password is loaded from `.env` via `REDIS_PASSWORD`. For production-like setups, move secrets to a secure secrets manager.

## Makefile shortcuts

Run `make` (or `make help`) to see the available commands:

```text
Available commands:

    make up     Start Redis container (detached)
    make down   Stop and remove containers
    make logs   Follow container logs
    make cli    Open redis-cli (uses REDIS_PASSWORD)
    make backup Run metrics backup inside container
```

Common usage:

```bash
make up
make cli
make backup
make down
```

## Project structure

```
.
├── docker-compose.yml
└── dados
    ├── backup_metrics.sh
    ├── appendonlydir/
    ├── dump.rdb
    └── stats/
```
