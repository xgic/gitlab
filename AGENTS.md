# AI Agent Instructions for XGIC GitLab (public exemplary)

**This is the primary context document for AI coding assistants (especially Grok Build).**

Read this file completely before starting any significant work in the repository.

---

## How We Work Together (Collaboration Principles)

These principles have been established to maximize effectiveness and maintain a positive, productive working relationship:

- **Agent optimization is a first-class goal.** Significant effort has gone (and will continue to go) into making this project exceptionally effective for Grok Build and similar AI coding assistants. This includes rich context in `AGENTS.md`, supporting playbooks, and clean architecture.

- **Tone and framing matter.** All documentation and code comments should use positive, constructive language. We do not criticize or use negative framing around GitLab, migrations, or the stack. Technical lessons from past work are only referenced when they help prevent specific future mistakes.

- **GROK-TASKS.md is the lightweight task system.** For informal TODOs, ideas, reminders, and tasks that don't yet warrant GitHub issues, use `GROK-TASKS.md`. The user can add items simply by asking ("Add X to the Grok tasks"). I am responsible for keeping it organized and up to date.

- **Git management is delegated with specific expectations.** I am expected to manage Git proactively following common GitHub and open source best practices and strict GitHub Flow:
  - All work happens on short-lived branches.
  - Commits represent logical, atomic units of change with full functionality included.
  - Every commit must pass relevant verification (lint where applicable, manual review of compose/Dockerfile/config, and `xde` flows where used).
  - Use sensible Conventional Commit messages with clear scopes.
  - Detailed commit messages for initial/bootstrap commits: describe files introduced, setup, and reference the platform tracking issue.
  - Clean history before pushing or merging to main (interactive rebase/squash where appropriate).
  - **Squash related small changes**: When a high number of small related changes are made, squash them into one fully detailed Conventional Commit that documents all modifications. This rule does not apply to completely unrelated changes, which must be submitted in separate merge requests or pull requests.
  - **Mandatory human review gate**: No push or merge to `main` without explicit human verification and approval. See the human review gate section.
  - I have autonomy to prepare branches and commits locally following these guidelines.

- **xde is the standard for container and environment tasks.** No Makefiles are created or used. Use `xde` (or direct equivalent patterns) for Docker, Compose, environment validation, and related orchestration. Generalizations are contributed back to the xde library.

- **Positive, forward-looking mindset.** Discussions and documentation focus on where we are going and how to deliver excellent, production-grade GitLab experiences.

- **Documentation Professionalism & Security**:
  - Use professional language in all artifacts, issues, and PRs. Avoid labels like "**Positive update:**".
  - Do not reference ruleset bypass details unless the work specifically targets the rulesets.

- **Status Reporting (Mandatory)**:
  - Use exact Session ID "XGIC GitLab" in all reports and documentation.
  - Respond to "session status report" / "generate status report" (or equivalent triggers) by writing `.xgic/grok-build/status-report.md` using the canonical template from XGIC Foundation (public/sanitized).
  - `.xgic/` must be in `.gitignore` (never commit Grok Build status reports or local coordination artifacts).

- **Attribution**: When describing specific human actions performed in the GitHub platform (e.g., merge, approval, review), use the actual username (e.g., "merged by @xgic via GitHub web UI").

- **Attribution**: When describing specific human actions performed in the GitHub platform (e.g., merge, approval, review), use the actual username (e.g., "merged by @xgic via GitHub web UI").

These principles take precedence. When in doubt, refer back to this section.

---

## Mission: Production-Grade, Configuration-Driven GitLab EE for Everyone

The goal of this public exemplary repository is to provide the **best possible starting point** for running a secure, optimized, production GitLab Enterprise Edition deployment using Docker Compose (and as reference for Kubernetes / cloud).

This means:
- A clean, version-pinned, configuration-driven multi-container stack (GitLab EE + PostgreSQL + supporting services).
- Highly optimized official-image-based or lightly wrapped production images.
- Excellent support for on-premises Compose, Kubernetes, AWS, and other environments.
- Living documentation and CI/CD that makes GHCR releases reliable and auditable.
- Full compliance with open licensing and security boundaries.

An agent (or human) cloning this repo should quickly understand the architecture and be able to stand up a high-quality GitLab instance or adapt the definitions.

**Is this goal achievable?**

**Yes. It is very achievable.**

---

## Hard Security Rule (Non-Negotiable — Zero Exposure)

**Zero exposure (absolute)**: No mentions, names, details, architectures, experiments, timelines, strategies, links, or any information that would reveal the existence, identity, or structure of any private repositories or private coordination hubs may ever be placed in any public XGIC repository (this repo, or any other public one). This includes documentation, prompts, code, issues, PRs, READMEs, or any Grok output.

All detailed coordination, private project work, GitLab experiments, and anything involving private repos or sensitive strategy lives *exclusively* in the authoritative private AI orchestration repository.

**This repository is scoped exclusively to the public XGIC GitLab exemplary definitions.** Do not produce output intended for private repos or that would leak private coordination details.

**Enforcement**:
- Public repositories and public sessions must remain completely silent on private details and structures.
- High-level statements are allowed only in the most abstract form when necessary.
- Human review of any proposed public content is required to prevent leakage.
- Violations are treated as security incidents and must be corrected immediately.

---

## Session Startup Checklist (Run These Early)

**Important**: Use `xde` for container and environment tasks wherever possible.

At the beginning of almost every session, gather this context:

1. `grok inspect`
2. `git status --short`
3. `git remote -v` and current branch
4. Review AGENTS.md, relevant docs (architecture.md, grok-playbooks.md, orchestration-workflow.md), and the LICENSE-VERIFICATION.md.
5. `xde --help` (or python -m equivalent) and `xde check` / environment validation when container work is involved.
6. Review current `docker-compose.yml` (or stack definition) and `.env.example`.

Output a short summary of the environment and repo state to the human before proposing actions.

---

## Core Mental Model

**This project delivers a generalized production GitLab stack**:

- **Official GitLab EE images** (pinned versions) as the foundation.
- **Externalized PostgreSQL** + supporting services (Redis, etc.) for optimized, scalable production setups.
- **Configuration-driven**: environment variables, templates, and compose profiles for different environments (dev/staging/prod) and deployment targets.
- **Image build / CI path** to GHCR for reproducible releases.
- **No Makefiles** — `xde` (and direct Compose where `xde` does not yet cover GitLab-specific flows) is the interface for environment tasks.

Key invariants for agents:
- Version pinning is mandatory (never "latest" in committed definitions for production paths).
- Security and least-privilege for volumes, networks, and GitLab omnibus config.
- Clear separation between the orchestration code (Apache 2.0) and GitLab EE (separately licensed).
- All artifacts must remain fully compliant with the Hard Security Rule.

---

## Grok-Specific Workflows

### Workflow A: "I just cloned — get me into a working state"
1. Run the session startup checklist.
2. Review `docs/architecture.md` and `docs/orchestration-workflow.md`.
3. Inspect the current stack: `docker compose config` (or `xde` equivalent when available for this stack).
4. Use `xde` (or prepare equivalent) for any container lifecycle work.
5. For changes, follow the orchestration workflow and GitHub Flow.

### Workflow B: Making changes to stack definitions, Dockerfiles, CI
1. Work on a feature branch.
2. Update the relevant high-level structure (compose, configs, Docker, workflows).
3. Verify with `xde` flows (or Compose validation) + any linting.
4. Update docs, AGENTS.md, and playbooks as needed.
5. Produce atomic Conventional Commits.
6. Draft PR using the template (includes explicit gate language).
7. Human verification + approval required before merge to main.

### Workflow C: Bootstrap / major structure work (this repo)
Follow BASE-STANDARDS and this playbook:
- Create (or reference) the platform coordination issue first.
- Detailed commit message describing files/setup.
- Reference issues #5 (GitLab migration) and #2 (public exemplary launches).
- Human LGTM required before any commit that lands on main and before any remote action.
- All drafts carry: "Human verification and approval required before any remote action or merge to main."

---

## xde Command Philosophy & No Makefiles

`xde` is the preferred single interface for dev container, environment, and containerized orchestration tasks.

- Default to `xde` (or its generalizations) for starting, resetting, validating, and orchestrating stacks.
- When a need arises that xde does not yet cover for GitLab EE stacks, implement via thin, testable helpers or contribute the generalization to the xde library.
- Strong safety: `--dry-run` (or equivalent) for anything destructive or expensive. Clear blast radius explanation.
- No new Makefiles or make targets in this repository.

See `docs/orchestration-workflow.md` and the xde reference in the sibling xde project for patterns (EnvironmentContext, reliable Docker/Compose controller via subprocess, etc.).

---

## Safety & Destructive Operations

- Always start destructive or state-changing container work with `--dry-run` / preview.
- Explain blast radius to the human.
- Prefer targeted operations.
- GitLab data volumes are precious — treat `reset` / volume operations with extreme care.

---

## How to Collaborate With the Human

- When the task is ambiguous, ask clarifying questions early.
- For destructive operations, always surface the plan and get explicit confirmation.
- Draft issues and PRs as clean professional artifacts carrying the explicit gate sentence.
- Keep `AGENTS.md` updated.
- All remote actions (branch create via tools, issue/PR creation, pushes) require prior human verification and LGTM.

**Preferred workflow for issues, PRs, docs, and planning**:
- Early ideation: lightweight notes if needed.
- Ready for sharing: draft the complete Markdown body here first.
- After explicit review and LGTM: proceed to platform creation (with gate language embedded).
- All merges require human platform review + approval.

**Full Artifact Requirements (Platform-native)**:
- Use assignments (e.g., @xgic), consistent labels (type/, priority/, status/, area/, review/, grok/), milestones (for releases, major/epics/coordinated work — not for all small changes).
- Drafts must carry the exact gate sentence where relevant.
- Human performs review/approval in the GitHub web UI.

---

## Common Pitfalls Specific to This Project

- Using "latest" tags instead of explicit version pins in committed Compose / CI definitions.
- Forgetting that GitLab EE requires separate licensing for production use.
- Placing private coordination details, repo names, or links into public files (hard rule violation).
- Reaching for shell `docker compose` directly instead of `xde` when container tasks arise.
- Weak safety defaults on volume or reset operations.
- Missing updates to docs, AGENTS, or templates when the stack or process changes.

---

## Quick Reference for Grok

**First commands in a session:**
```pwsh
grok inspect
git status --short
git remote -v ; git branch --show-current
```

**Environment / container work:**
```bash
xde --help
xde check
# or equivalent xde flows for the GitLab stack
docker compose config   # validation only
```

**Before finishing non-trivial work:**
- Verify stack definitions (compose config, env example consistency).
- Update AGENTS.md / relevant docs / playbooks if mental model or workflows changed.
- Ensure every draft artifact contains: "Human verification and approval required before any remote action or merge to main."
- Ensure references to coordination (#5, #2) where appropriate.
- Follow Conventional Commits and positive framing.

**Additional high-value reading (in recommended order):**
1. `docs/grok-playbooks.md`
2. `docs/architecture.md`
3. `docs/orchestration-workflow.md`
4. `docs/LICENSE-VERIFICATION.md`
5. `docs/BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md` (public variant)
6. `.github/CONTRIBUTING.md`
7. `README.md`

**Last major update**: 2026 — Bootstrap for generalized GitLab EE production stack (public exemplary).

This document exists to help agents deliver reliable, secure, and exemplary GitLab orchestration while protecting boundaries and following disciplined processes.

Thank you for helping build excellent public examples.
