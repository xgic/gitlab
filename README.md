# XGIC GitLab — Docker Compose template

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![GitLab EE](https://img.shields.io/badge/GitLab_EE-official_image-8c8c8c?logo=gitlab&logoColor=white)](https://about.gitlab.com/)
[![Docker Compose](https://img.shields.io/badge/Docker-Compose-blue?logo=docker&logoColor=white)](https://docs.docker.com/compose/)

**End-user template** for a production-oriented **GitLab Enterprise Edition** stack on Docker Compose:

| Service | Image |
|---------|--------|
| XGIC orchestration (starts **first**) | `ghcr.io/xgic/xgic-gitlab` ([built by gitlab-dev](https://github.com/xgic/gitlab-dev)) |
| GitLab EE | Official `gitlab/gitlab-ee` (unaltered) |
| PostgreSQL | Official `postgres:18` |
| Redis | Official `redis:8.8` |

Architecture: [ADR-0001](https://github.com/xgic/ai/blob/main/docs/adr/0001-xgic-gitlab-architecture-and-repository-naming.md).  
Standards: [xgic/ai](https://github.com/xgic/ai).

## Dual-repo model

| Repository | Role |
|------------|------|
| [xgic/gitlab-dev](https://github.com/xgic/gitlab-dev) | Dev Container + multi-stage **build/publish** of `ghcr.io/xgic/xgic-gitlab` |
| **This repo** | Clean **template** Compose stack for operators |

## Features

- Official GitLab EE with explicit version pins
- External PostgreSQL and Redis (production-oriented)
- XGIC orchestration container for ops/health (primary Compose service)
- Configuration via `.env` (no hard-coded private hosts)
- Apache-2.0 for orchestration definitions only (not a GitLab EE license)

## Quick start

```bash
git clone https://github.com/xgic/gitlab.git
cd gitlab
cp .env.example .env
# Edit version pins and secrets
docker compose config
docker compose up -d
```

**Note:** Until `ghcr.io/xgic/xgic-gitlab` publishes tagged releases, build locally from [gitlab-dev](https://github.com/xgic/gitlab-dev) and set `XGIC_GITLAB_IMAGE` / `XGIC_GITLAB_TAG` in `.env`.

**Important:** GitLab EE requires a valid license for production use. This repository’s Apache-2.0 license covers orchestration definitions only.

## Repository Structure (High-Level)

```
.
├── .github/
│   ├── CONTRIBUTING.md
│   ├── CODEOWNERS
│   ├── dependabot.yml
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/          # Build + release to GHCR
├── config/                 # Example gitlab.rb, templates
├── docs/
│   ├── architecture.md
│   ├── BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md
│   ├── grok-playbooks.md
│   ├── LICENSE-VERIFICATION.md
│   └── orchestration-workflow.md
├── stack/                  # Compose and related definitions (or root)
│   └── docker-compose.yml
├── .env.example
├── .gitignore
├── AGENTS.md
├── LICENSE
└── README.md
```

## License & Verification

Copyright 2026 XGIC.  
This repository is licensed under the [Apache License, Version 2.0](LICENSE). See [NOTICE](NOTICE).

A formal verification of suitability for the supported production and educational use cases is maintained in:

- [docs/LICENSE-VERIFICATION.md](docs/LICENSE-VERIFICATION.md)

**Status**: Verified (see document for scope, caveats, and user responsibilities).  
**Note:** Apache-2.0 covers this repository's orchestration definitions only; it does not grant rights to GitLab EE itself.


## Contributing

Please read:
- [AGENTS.md](AGENTS.md) (especially the Hard Security Rule and startup checklist)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [docs/orchestration-workflow.md](docs/orchestration-workflow.md)

Follow GitHub Flow, Conventional Commits, the human review gate, and positive framing at all times.



## Coordination

This work directly supports coordinating the GitLab migration effort and public exemplary launches.

All artifacts, issues, and PRs reference high-level coordination trackers where relevant.

---

Thank you for helping deliver excellent, production-ready GitLab tooling for the community.
