# Contributing to `xgic/gitlab`

**Project**: [xgic/gitlab](https://github.com/xgic/gitlab)  
**Purpose**: The home for the generalized, configuration-driven production GitLab EE image and optimized multi-container Compose stack (GitLab EE + PostgreSQL + supporting services). Supports production deployments across Docker Compose, Kubernetes, AWS, and other environments. This is a public exemplary repository.

We welcome contributions that improve the stack, add environment support, enhance security and performance, improve documentation, or strengthen the CI/CD release process.

By participating, you agree to abide by our [Code of Conduct](#code-of-conduct) and the implicit Contributor License Agreement upon PR submission.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Coding Standards & Best Practices](#coding-standards--best-practices)
- [GitHub Flow & Branching Strategy](#github-flow--branching-strategy)
- [Commit Message Convention](#commit-message-convention)
- [Pull Request Guidelines](#pull-request-guidelines)
- [For AI Coding Assistants (Grok Build)](#for-ai-coding-assistants)
- [Reporting Issues](#reporting-issues)

## Code of Conduct

We follow the [Contributor Covenant Code of Conduct (v2.1)](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).

## Coding Standards & Best Practices

**Start here**: Read `AGENTS.md` completely. It is the primary context for agents and the collaboration model.

### Repository Focus
- Dockerfiles and multi-stage image definitions (when used)
- Docker Compose stacks with external PostgreSQL and supporting services
- Configuration templates (config-driven, version-pinned)
- GitHub Actions for image builds and GHCR publishing
- Documentation and living examples

### Required Standards
- Follow official Docker best practices.
- All Compose definitions and image references use explicit version pins (never bare `latest` in committed production paths).
- YAML must be valid and pass `docker compose config`.
- Prefer configuration and environment variables over hard-coded values.
- Documentation updates are required when user-facing behavior or architecture changes.
- **No Makefiles**. Use `xde` (or the documented Compose interface) for container and environment tasks.

### Positive Framing
All contributions use constructive, forward-looking language.

## GitHub Flow & Branching Strategy

- `main` is the single source of truth and is always stable.
- All work occurs on short-lived feature branches.
- Changes are integrated exclusively via Pull Requests.
- Branch protection requires at least one human approval + passing automated checks before merge.
- **Human verification and approval required before any remote action or merge to main.**

## Commit Message Convention

Use detailed Conventional Commits.

**Squash rule for related changes**: When a high number of small related changes are made, squash them into one fully detailed Conventional Commit that documents all modifications. This rule does not apply to completely unrelated changes, which must be submitted in separate merge requests or pull requests.

Example:
```
feat(stack): add external Postgres service with healthcheck and persistent volume

- Introduce postgres service in docker-compose.yml
- Add .env.example with version pins and basic GITLAB_ vars
- Update docs/architecture.md with data layer description
- Aligns with migration requirements and public exemplary goals

Refs: #5, #2
```

- Body explains the "what" and "why".
- Include relevant issue references.
- Keep commits atomic and complete (full change + tests/verification + docs).

**Bootstrap / initial commits**: Must follow the rules in `docs/BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md`. A platform tracking issue is created first. The commit message describes the full setup, references the issue, and uses positive framing. Human LGTM is required before the commit.

## Pull Request Guidelines

1. Create a focused PR from your branch.
2. Fill out the PR template completely.
3. Ensure the PR body contains the gate sentence where required for AI-assisted work.
4. Link related issues (e.g. "Refs #5").
5. All checks must pass.
6. Request review. A human must approve in the GitHub UI before merge.
7. Rebase or merge main as needed for a clean history.

## For AI Coding Assistants (Grok Build)

This is a public exemplary repository. All work follows the external-contributor-simulation model plus internal AGENTS.md guidelines.

**Mandatory**:
- Read `AGENTS.md` first on every session.
- Restate and follow the Hard Security Rule at all times (zero leakage of private details).
- Use `xde` for container/environment tasks. No Makefiles.
- Produce clean professional drafts only. Every draft issue or PR body must contain the exact sentence:
  > Human verification and approval required before any remote action or merge to main.
- Never perform remote actions (branch, issue, PR, push) without prior explicit human LGTM in this conversation or platform.
- All PRs require human code review performed in the GitHub web interface.
- Reference coordination issues #5 (GitLab migration) and #2 (public exemplary launches) from relevant artifacts.
- Follow Conventional Commits, positive framing, and update AGENTS.md + playbooks when the mental model or process changes.

See `.github/PULL_REQUEST_TEMPLATE.md`, `AGENTS.md`, and `docs/grok-playbooks.md` for details.

## Reporting Issues

Use the issue templates. Provide clear reproduction steps, expected behavior, and environment details.

All issue descriptions for AI-assisted work should include the human gate sentence.

**Human verification and approval required before any remote action or merge to main.**
