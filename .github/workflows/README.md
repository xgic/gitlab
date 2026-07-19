# CI note

Image build/publish lives in https://github.com/xgic/gitlab-dev.

This template repository runs **Validate Compose** (`validate-compose`) on pull
requests and `main` to check `docker-compose.yml` against `.env.example` and
assert the dual-repo service set (`xgic-gitlab`, `gitlab-ee`, `postgres`,
`redis`).
