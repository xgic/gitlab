## Description

<!-- Provide a clear and concise description of the changes. -->

## Type of Change

- [ ] Bug fix (non-breaking change that fixes an issue)
- [ ] New feature (non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] Documentation update
- [ ] Stack / Infrastructure / Compose improvement
- [ ] CI/CD / Image build / GHCR release work
- [ ] Security or configuration hardening

## Testing & Verification

**Required before requesting review** (see AGENTS.md and docs/orchestration-workflow.md):

- [ ] `docker compose config` validates cleanly (or `xde` equivalent used)
- [ ] Version pins reviewed; no bare `latest` in production paths
- [ ] Stack tested for the affected environments (compose up / health checks)
- [ ] Documentation (README, architecture, playbooks) updated where user-facing
- [ ] `.github/` templates and AGENTS.md considered for updates
- [ ] No private details or leakage introduced (Hard Security Rule)
- [ ] Sanitization enforced: no private issue numbers (#5, #2 etc.), private URLs, or direct private coordination refs; only high-level descriptive text used

## Checklist

- [ ] My code / definitions follow the style and process in [CONTRIBUTING.md](.github/CONTRIBUTING.md) and AGENTS.md
- [ ] I have performed a self-review
- [ ] I have made corresponding documentation updates
- [ ] Changes generate no new warnings or obvious security issues
- [ ] Related high-level coordination references used (descriptive text only; no private issue numbers)

## AI Assistance

- [ ] This PR (or the work leading to it) was prepared with assistance from Grok Build (or similar).
- Human verification steps completed before remote actions (list comments, approvals, or "LGTM received"):
- Explicit gate language is present in drafts.

## Related Issues

<!-- e.g. Closes #123 or high-level coordination reference for the GitLab migration effort and public exemplary launches (sanitized, descriptive text only) -->

**Human verification and approval required before any remote action or merge to main.**
