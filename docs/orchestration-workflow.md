# Orchestration Workflow

This document describes the day-to-day process for working in the repository.

**Always positive framing. Strict GitHub Flow. xde for container tasks. Human gate on everything to main.**

## Core Rules

- `main` is the single source of truth.
- Short-lived branches only.
- All integration via Pull Requests.
- Detailed Conventional Commits.
- **Squash related small changes**: When a high number of small related changes are made, squash them into one fully detailed Conventional Commit that documents all modifications. This rule does not apply to completely unrelated changes, which must be submitted in separate merge requests or pull requests.
- Update documentation and AGENTS.md as part of the same change when the model or process evolves.
- Use `xde` (preferred) or validated Compose commands for any container / environment work. No Makefiles.
- **Attribution**: Use @username for specific human actions (e.g., "merged by @xgic via GitHub web UI").
- Follow the mandatory human review gate before any remote action or merge to main — see AGENTS.md and BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md.

## Session Flow (Typical)

1. Run the startup checklist from `AGENTS.md`.
2. Review relevant docs and current definitions.
3. Make focused changes on a feature branch.
4. Validate (`docker compose config`, stack smoke where safe, or `xde` flows).
5. Commit atomically with full context.
6. Open PR using the template (include gate language and refs to #5 / #2).
7. Address review feedback.
8. Human approves in GitHub UI.
9. Merge only after approval + checks.

## Bootstrap / Initial Commits (Special)

Per BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md:

- Create the platform tracking issue first (full professional body with plan, checklist, exact gate sentence).
- Detailed commit message that lists introduced files, describes the base set application, stack skeleton, xde direction, license verification, and references the issue.
- Explicit human LGTM before the commit lands and before any remote action.
- Clean, professional, forward-looking.

## Pre-Change Verification

- Read AGENTS.md and the Hard Security Rule.
- Confirm no private details will be introduced.
- For stack changes: validate compose, review pins, consider blast radius for data volumes.
- Run relevant `xde` commands (or equivalent) with `--dry-run` first.

## Documentation Updates

Changes to behavior, architecture, or process must be reflected in:
- README.md
- docs/architecture.md
- docs/grok-playbooks.md
- AGENTS.md (when agent workflows change)
- This file when the process itself changes

## Releasing Images

- Use annotated tags (vX.Y.Z).
- The GHCR workflow builds and publishes.
- Update CHANGELOG or release notes as part of the PR.
- Human approval required on the release PR / tag.

## Coordination References

Primary trackers:
- #5 GitLab migration
- #2 Public exemplary launches

All artifacts should link back to these where relevant.

**Human verification and approval required before any remote action or merge to main.**
