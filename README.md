# XGIC GitLab — Docker Compose template

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![GitLab EE](https://img.shields.io/badge/GitLab_EE-self--managed-8c8c8c?logo=gitlab&logoColor=white)](https://about.gitlab.com/pricing/?deployment=self-managed-deployment)
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
- Apache-2.0 for orchestration definitions only (does not license GitLab EE software)

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

### GitLab Enterprise Edition licensing (self-managed)

This template runs the official **GitLab Enterprise Edition** container image under GitLab’s **Self-Managed** deployment model—software you host and operate (for example on-premises or in your own cloud account), not GitLab.com SaaS.

**Free tier for self-managed EE.** GitLab EE can be operated **without a paid subscription**. The free (Core) tier of self-managed EE provides a generous set of capabilities for private projects and internal DevSecOps platforms: source control, CI/CD, issues and planning basics, and related collaboration features, subject to GitLab’s published free-tier limits. That combination is well suited to private organizational instances, labs, and production-ready foundations that may later grow in scale or compliance needs.

**Why EE (not Community Edition) for XGIC-oriented stacks.** Standardizing on the official EE image from day one:

- Keeps private projects on a modern, enterprise-aligned product line while remaining free to start  
- Avoids a later CE → EE migration when advanced security, compliance, or scale features are required  
- Supports a clean commercial path: apply a **Premium** or **Ultimate** self-managed subscription to the same EE instance when the organization is ready  

Always confirm current feature sets and commercial terms on GitLab’s Self-Managed pricing page:

https://about.gitlab.com/pricing/?deployment=self-managed-deployment

**This repository’s license.** The **Apache License 2.0** in this project applies only to XGIC orchestration definitions (Docker Compose, configuration examples, documentation, and related automation). It does **not** license GitLab EE software. Use of the `gitlab/gitlab-ee` image is governed by GitLab’s own terms for self-managed deployments.

## Repository Structure (High-Level)

```
.
├── .github/
│   ├── CONTRIBUTING.md
│   ├── CODEOWNERS
│   ├── dependabot.yml
│   ├── ISSUE_TEMPLATE/
│   ├── PULL_REQUEST_TEMPLATE.md
│   └── workflows/          # Template CI notes (image build in gitlab-dev)
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
**Note:** Apache-2.0 covers this repository’s orchestration definitions only. The official GitLab EE image is governed by GitLab’s **Self-Managed** licensing (free tier with limits, or paid Premium/Ultimate). See [Self-Managed pricing](https://about.gitlab.com/pricing/?deployment=self-managed-deployment) and the licensing section above.


## Contributing

Please read:
- [AGENTS.md](AGENTS.md) (especially the Hard Security Rule and startup checklist)
- [CONTRIBUTING.md](CONTRIBUTING.md)
- [docs/orchestration-workflow.md](docs/orchestration-workflow.md)

Follow GitHub Flow, Conventional Commits, the review gate, and positive framing at all times.



## Coordination

This work directly supports coordinating the GitLab migration effort and public exemplary launches.

All artifacts, issues, and PRs reference high-level coordination trackers where relevant.

---

Thank you for helping deliver excellent, production-ready GitLab tooling for the community.
