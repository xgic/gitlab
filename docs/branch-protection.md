# Branch Protection Policy (main)

**Purpose**: Protect `main` as the single source of truth. This enforces the project's commitment to GitHub Flow, human review gates, Conventional Commits, clean history, and security boundaries for the public exemplary GitLab EE production stack.

This aligns with the base standards in [docs/BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md](BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md), [AGENTS.md](../AGENTS.md), and [.github/CONTRIBUTING.md](../.github/CONTRIBUTING.md).

## Current Protection (Applied)

Branch protection is enabled on `main` with the following rules (via GitHub branch protection):

- Require a pull request before merging (minimum 1 approving review)
- Dismiss stale pull request approvals when new commits are pushed
- Require review from Code Owners (enforced via [CODEOWNERS](../.github/CODEOWNERS))
- Require linear history
- Do not allow force pushes
- Do not allow deletions
- Require conversation resolution before merging (recommended)

Enforce admins: enabled (true) — direct changes to main are prevented; emergency bypass only via documented admin procedures.

Status checks: Required for "build-and-push" (strict: branches must be up to date before merging). The CI job now runs on all PRs to main (compose validation + multi-platform build test).

## How Protection Supports Our Process

- All changes (including Grok-assisted work via MCP) must go through short-lived branches + Pull Requests.
- Human verification and approval is required in the GitHub UI before merge to main.
- Linear history + Conventional Commits keep the public history high-quality and bisectable.
- CODEOWNERS + review requirement ensures key paths (compose, Docker, CI, docs, AGENTS) receive proper oversight.
- This makes the "Human verification and approval required before any remote action or merge to main" gate mechanical and visible.

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

See also:
- [orchestration-workflow.md](orchestration-workflow.md)
- [grok-playbooks.md](grok-playbooks.md)
- [CONTRIBUTING.md](../.github/CONTRIBUTING.md)

**Human verification and approval required before any remote action or merge to main.**
