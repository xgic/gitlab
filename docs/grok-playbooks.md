# Grok Playbooks

Concrete step-by-step workflows for common tasks in this repository.

**Always start every session by following the Session Startup Playbook in AGENTS.md.**

All work uses positive framing and follows the Hard Security Rule.

---

## Session Startup Playbook

1. `grok inspect`
2. `git status --short`
3. `git remote -v` ; current branch
4. Review AGENTS.md, docs/BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md (public), architecture.md, orchestration-workflow.md, and LICENSE-VERIFICATION.md
5. For container work: `xde --help` / `xde check` (or equivalent)
6. Inspect current stack: `docker compose config`
7. Summarize state to the human before proposing actions.

---

## Playbook: Add or Update a Service in the Stack

1. Update `docker-compose.yml` (add service, healthcheck, depends_on, volumes, env).
2. Update `.env.example` with new variables and comments.
3. Update `docs/architecture.md` if layers or data model changed.
4. Validate: `docker compose config`
5. (Optional but recommended) Exercise with `xde` (or documented dry-run compose).
6. Update README quick start or docs if user-facing.
7. Conventional commit + PR with refs #5, #2 and gate sentence.

---

## Playbook: Version Pin Update (GitLab EE or Supporting)

1. Identify the new stable version from official sources.
2. Update `docker-compose.yml` default and comments.
3. Update `.env.example` and any workflow build-args.
4. Update Dockerfile ARG default if present.
5. Validate compose.
6. Test (dry-run) and document the change.
7. PR with clear "why this version" in body.

Never use unpinned "latest" in production definitions.

---

## Playbook: CI / GHCR Workflow Change

1. Edit `.github/workflows/*.yml`.
2. If adding new permissions or secrets paths, document in workflow comments.
3. Use `docker compose config` + manual review of the workflow.
4. Test via workflow_dispatch where possible.
5. PR must pass actionlint / yaml validation if available.
6. Include gate sentence for AI-assisted work.

---

## Playbook: Documentation Improvement

1. Make the change in the relevant .md file(s).
2. Ensure the Hard Security Rule is not violated.
3. Cross-link coordination (#5, #2) where helpful.
4. Update AGENTS.md if agent behavior or startup changes.
5. Commit + PR.

---

## Playbook: Bootstrap Work (Initial Public Setup)

- Create the platform issue first (complete body, plan, checklist, exact gate sentence: "Human verification and approval required before any remote action or merge to main.").
- Implement base set + high-level stack skeleton.
- License verification gate documented.
- All artifacts reference #5 and #2.
- Detailed initial commit message.
- Explicit human LGTM before commit and before any remote.

See BASE-STANDARDS and orchestration-workflow.md for full requirements.

**Human verification and approval required before any remote action or merge to main.**
