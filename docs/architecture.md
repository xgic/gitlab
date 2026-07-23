# Architecture Overview

This document provides AI agents (Grok Build) and humans with a clear mental model of the XGIC GitLab public exemplary repository.

## Purpose

Deliver a **generalized, configuration-driven, production-ready GitLab EE stack** using official images and a clean multi-container Compose definition.

The stack supports:
- Docker Compose (primary for this repo)
- Reference patterns for Kubernetes and cloud (AWS etc.)
- Educational and tutorial reuse

## High-Level Layers

1. **Base Images (Official)**
   - `gitlab/gitlab-ee:<pin>-ee.0`
   - `postgres:<pin>` — **latest major supported by that GitLab EE major** (default **17** for EE 18.x)
   - Supporting (redis etc.)

2. **Orchestration Layer**
   - `docker-compose.yml` + `.env` / `.env.example`
   - Version pinning and profiles for different environments
   - External PostgreSQL (and optional Redis) for production scalability
   - PostgreSQL pin follows GitLab’s published support matrix (max supported major), revalidated when EE upgrades

3. **Configuration Layer**
   - `config/` templates (e.g. gitlab.rb snippets)
   - `GITLAB_OMNIBUS_CONFIG` and environment variables
   - Clear separation between orchestration (Apache 2.0) and GitLab EE (separate license)

4. **Image / Release Layer**
   - Optional thin `Dockerfile` wrapper for labels, health, or future optimization
   - GitHub Actions → GHCR publishing path

5. **Agent / Environment Interface**
   - `xde` is the preferred tool for container and environment tasks.
   - No Makefiles.

## Key Invariants

- Explicit version pins everywhere in committed files.
- Security-first: least-privilege volumes, networks, and GitLab settings.
- The license of this repo covers only the definitions and helpers.
- Full compliance with the Hard Security Rule — zero private leakage.
- All changes go through GitHub Flow + review gate.

## Coordination

This architecture directly supports coordinating the GitLab migration effort and serves as the public exemplary implementation.



See:
- `docker-compose.yml`
- `docs/orchestration-workflow.md`
- `docs/grok-playbooks.md`
- `AGENTS.md`
