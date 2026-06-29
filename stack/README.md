# Stack Definitions (Production Profiles & Overrides)

This directory contains optional production-oriented Compose definitions and configuration for the generalized GitLab EE stack.

## Usage

Base (quick):
```bash
docker compose up -d
```

With production profile + overrides:
```bash
docker compose -f docker-compose.yml -f stack/docker-compose.prod.yml --profile prod up -d
```

See root `docker-compose.yml` and `.env.example` for configuration-driven options (version pins, volumes, external_url, etc.).

## Contents
- `docker-compose.prod.yml`: Stronger resource limits, backup notes, HTTPS guidance, tuned Postgres.
- Additional overrides and examples will be added as the stack matures for v1.0.0.

## Production Recommendations (Summary)
- **Backups**: Use `gitlab-backup create` (volume mounted at /var/opt/gitlab/backups). Schedule externally.
- **HTTPS/TLS**: Set `GITLAB_EXTERNAL_URL=https://...` . Use Let's Encrypt via Omnibus or external proxy.
- **Resources**: Defined in compose; tune per environment and load.
- **Scaling**: Single Compose is great for small-medium; use K8s for large.
- **Security**: Keep .env secret, restrict ports, regular image updates.

**Review and approval required before any remote action or merge to main.**

High-level coordination references for the GitLab migration effort and public exemplary launches; v1.0.0 (public milestone #1)
