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
5. Perform initial sanitization/leak audit (grep for private refs like coordination issue numbers, private domains).
6. For container work: `xde --help` / `xde check` (or equivalent)
7. Inspect current stack: `docker compose config`
8. Summarize state to the human before proposing actions.

---

## Playbook: Add or Update a Service in the Stack

1. Update `docker-compose.yml` (add service, healthcheck, depends_on, volumes, env).
2. Update `.env.example` with new variables and comments.
3. Update `docs/architecture.md` if layers or data model changed.
4. Validate: `docker compose config`
5. (Optional but recommended) Exercise with `xde` (or documented dry-run compose).
6. Update README quick start or docs if user-facing.
7. Conventional commit + PR with high-level coordination references (if needed) and gate sentence.

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
2. Ensure the Hard Security Rule and Mandatory Sanitization Rule are not violated (no private refs; use high-level text).
3. Cross-link high-level coordination for the GitLab migration effort and public exemplary launches where helpful.
4. Update AGENTS.md if agent behavior or startup changes.
5. Commit + PR.

---

## Playbook: Bootstrap Work (Initial Public Setup)

- Create the platform issue first (complete body, plan, checklist, exact gate sentence: "Review and approval required before any remote action or merge to main.").
- Implement base set + high-level stack skeleton.
- License verification gate documented.
- All artifacts follow sanitization: use only high-level references for the GitLab migration effort and public exemplary launches.
- Detailed initial commit message.
- Explicit human LGTM before commit and before any remote.

## Playbook: Sanitization (Mandatory Before Every Change)

1. Search the changes and entire repo for risky patterns: private issue numbers (e.g. #5, #2 in coordination context), private domains/URLs, direct private repo paths or "Refs: #X" to non-public trackers.
2. Replace any found with high-level text:
   - "coordinating the GitLab migration effort"
   - "public exemplary launches"
   - "High-level coordination references for the GitLab migration effort and public exemplary launches"
3. Confirm only public GitHub numbers from *this repo* (e.g. this project's PR #12) remain.
4. Add sanitization checklist confirmation in PR description.
5. Run full leak audit as part of pre-PR verification.
6. If any private refs found post-merge, immediate corrective PR required.

This is a first-class security practice. See AGENTS.md and BASE-STANDARDS for the full rule.

See BASE-STANDARDS and orchestration-workflow.md for full requirements.

**Review and approval required before any remote action or merge to main.**
