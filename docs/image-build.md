# Image build location

Production orchestration images are **not** built from this template repository.

| Artifact | Location |
|----------|----------|
| Build / Dev Container / GHCR publish | https://github.com/xgic/gitlab-dev |
| Image | `ghcr.io/xgic/xgic-gitlab` |
| This repo | Docker Compose template only |

Official GitLab EE continues to use the unaltered vendor image `gitlab/gitlab-ee` in `docker-compose.yml`.
