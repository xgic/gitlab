# XGIC GitLab — Production GitLab EE Stack

[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GitLab EE](https://img.shields.io/badge/GitLab-EE-8c8c8c?logo=gitlab&logoColor=white)](https://about.gitlab.com/pricing/)
[![Docker](https://img.shields.io/badge/Docker-Compose-blue?logo=docker&logoColor=white)](https://docs.docker.com/compose/)

> **Public exemplary repository** — Generalized, configuration-driven production GitLab Enterprise Edition image definitions and optimized multi-container Compose stack (GitLab EE + PostgreSQL + supporting services).

This repository is the home for high-quality, reusable definitions that make it straightforward to run secure, maintainable, production-grade GitLab EE across a variety of environments.

**Primary coordination**:
- Coordinating the GitLab migration effort
- Public exemplary launches

## Features

- Official GitLab EE images with explicit version pinning
- Optimized multi-container Compose stack with external PostgreSQL (recommended for production scalability)
- Supporting services (Redis, etc.) as needed for a complete production profile
- Configuration-driven via environment and templates
- CI/CD-friendly structure targeting GHCR for releases
- Apache 2.0 licensing verified for the supported use cases (see `docs/LICENSE-VERIFICATION.md`)

## Supported Environments

- Docker Compose (on-premises and development)
- Kubernetes (Compose definitions serve as reference; Helm or manifests can be derived)
- AWS (EC2, ECS, EKS) and other cloud providers
- Educational, tutorial, and white-paper reuse

## v1.0.0 Release

v1.0.0 is the first stable production release. The reference image is published to GHCR on tag `v1.0.0`.

## Quick Start (Compose)

```bash
git clone https://github.com/xgic/gitlab.git
cd gitlab

# Review and customize
cp .env.example .env
# Edit .env with your external_url, version pins, secrets, etc.

docker compose up -d
```

See `docs/architecture.md`, the Compose file comments, and `stack/` for production recommendations (backups, HTTPS/TLS, resource limits, profiles, external Postgres/Redis, etc.).

The GHCR image for v1.0.0: `ghcr.io/xgic/gitlab/gitlab-ee:v1.0.0` (and semver tags).

**Important**: GitLab EE requires a valid license for production use. The Apache 2.0 license in this repository covers only the orchestration definitions and does not grant rights to GitLab EE itself.

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

This repository is licensed under the Apache License 2.0.

A formal verification of suitability for the supported production and educational use cases is maintained in:

- [docs/LICENSE-VERIFICATION.md](docs/LICENSE-VERIFICATION.md)

**Status**: ✅ Verified (see document for scope, caveats, and user responsibilities).

## Contributing

Please read:
- [AGENTS.md](AGENTS.md) (especially the Hard Security Rule and startup checklist)
- [.github/CONTRIBUTING.md](.github/CONTRIBUTING.md)
- [docs/orchestration-workflow.md](docs/orchestration-workflow.md)

Follow GitHub Flow, Conventional Commits, the human review gate, and positive framing at all times.



## Coordination

This work directly supports coordinating the GitLab migration effort and public exemplary launches.

All artifacts, issues, and PRs reference high-level coordination trackers where relevant.

---

Thank you for helping deliver excellent, production-ready GitLab tooling for the community.
