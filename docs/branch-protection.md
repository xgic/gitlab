# Branch Protection Policy (main)

**Purpose**: Protect `main` as the single source of truth. This enforces the project's commitment to GitHub Flow, human review gates, Conventional Commits, clean history, and security boundaries for the public exemplary GitLab EE production stack.

This aligns with the base standards in [docs/BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md](BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md), [AGENTS.md](../AGENTS.md), and [.github/CONTRIBUTING.md](../.github/CONTRIBUTING.md).

## Current Protection (Applied)

Branch protection is enforced on `main` via the active GitHub ruleset "main-protection-with-owner-bypass":

- Require a pull request before merging (1 approving review, dismiss stale reviews on push, require code owner review, allowed merge methods: merge/squash/rebase)
- Require linear history
- Deletion and non-fast-forward (no deletions or force pushes)
- Required status checks (strict policy for "build-and-push")

Owner bypass is configured for the repository owner as part of the ruleset.

Status checks: "build-and-push" is required (strict).

This uses GitHub Rulesets (preferred on public repos) for flexible enforcement.

## How Protection Supports Our Process

- All changes (including Grok-assisted work via MCP) must go through short-lived branches + Pull Requests.
- Review and approval is required in the GitHub UI before merge to main.
- Linear history + Conventional Commits keep the public history high-quality and bisectable.
- CODEOWNERS + review requirement ensures key paths (compose, Docker, CI, docs, AGENTS) receive proper oversight.
- This makes the "Review and approval required before any remote action or merge to main" gate mechanical and visible.

## Future Enhancements

- Add required status checks once reliable CI jobs run on PRs to main (e.g. compose validation, lint if added, basic smoke).
- Consider requiring signed commits for stronger auditability.
- When active release/* branches or other long-lived branches are introduced, apply equivalent protection.
- When using GitHub Rulesets (preferred on public repos), migrate the policy there for more flexible targeting and bypass controls.

## Setup Notes

Protection was configured automatically after the bootstrap and making the repository public (required to enable the feature on the plan).

To view or adjust:
- GitHub UI: Settings → Branches (or Rules → Rulesets for advanced)
- Or via `gh api` / REST for automation.

Test the flow:
1. Create feature branch from main.
2. Make atomic change + Conventional Commit.
3. Push and open PR.
4. Obtain the required review (human LGTM).
5. Merge (using rebase or squash to preserve linear history).

**Squash rule for related changes**: When a high number of small related changes are made (e.g. multiple coordinated doc updates), squash them into one fully detailed Conventional Commit that documents all modifications. Unrelated changes must use separate PRs.

## Enforcement History

The current protection (ruleset "main-protection-with-owner-bypass" with PR review + code owners + linear history + strict "build-and-push" status checks, owner bypass for the repository owner) and the full set of process rules were established through coordinated public work:

- Issues #7 (Rule Clarification: squash related small changes into one detailed Conventional Commit) and #8 (Enhance branch protection: enforce required status checks).
- PR #9: Implemented the squash rule via a single squashed Conventional Commit for related doc updates across key files.
- PR #10: Propagated the full current rules (2026-06-24) — hard security, human review gate (full/short form), @username attribution, xde standard (no Makefiles), professional tone, platform-native drafting + gh creation after LGTM, full artifacts (@xgic assignments, labels, milestones for major), high-level ruleset documentation only.
- PR #11: Implemented mandatory session status reports using exact Session ID "XGIC GitLab", `.xgic/grok-build/status-report.md` (with public template), updates to AGENTS.md / BASE-STANDARDS + .gitignore.

All changes followed strict GitHub Flow, short-lived branches, detailed Conventional Commits, positive framing, and the mandatory human review gate. Human performed review and approval in the GitHub web UI prior to merge. High-level coordination references used for the GitLab migration effort and public exemplary launches.

See also:
- [orchestration-workflow.md](orchestration-workflow.md)
- [grok-playbooks.md](grok-playbooks.md)
- [CONTRIBUTING.md](../.github/CONTRIBUTING.md)

**Review and approval per AGENTS.md and BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md.**
