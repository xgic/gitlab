# GROK-TASKS — XGIC GitLab (public exemplary)

Lightweight informal task tracker for ideas, reminders, and work not yet ready for GitHub issues.

Use this file for distillation. Authoritative tracking lives on the GitHub platform (issues referencing #5 and #2).

## Next / In Progress

- [x] Human review and LGTM of bootstrap artifacts (received)
- [x] Platform issue creation (#1) with full body + gate sentence
- [x] Initial commit (ccc70e3) after LGTM with detailed message + refs #1, #5, #2
- [x] Explicit human LGTM for `git push origin main` (bootstrap push executed after prior LGTM; see commits)
- [x] Verify/refresh LICENSE-VERIFICATION completeness and cross-refs for v1.0.0 (Apache 2.0 gate) — refreshed with 2026 confirmation + milestone ref
- [x] Populate/advance milestone v1.0.0 (#1) per new mandatory rule
- [x] Prepare for GHCR v1.0.0 release: updated pins/comments, added CHANGELOG.md, drafted release. Ready for tag.
- [x] Propagate full current rules (PR #10): updated AGENTS, BASE-STANDARDS, branch-protection (ruleset high-level), etc. LGTM on draft, PR created for human UI review.
- [x] Expand production stack (backups, HTTPS/TLS, resources, profiles, full config-driven; stack/ dir) — committed
- [x] Enhance CI/CD (GHCR, multi-platform via QEMU/Buildx, PR validation) — platforms + PR trigger

## Future / Roadmap

- Add production profiles (minimal, recommended, high-availability)
- Contribute useful generalizations back to the xde library for GitLab-style stacks
- Living tutorial content and example deployment guides
- Kubernetes reference manifests derived from the Compose definitions
- CI improvements: multi-platform builds, SBOM, provenance

## Done (recent)

- 2026-06-23: Bootstrap base set + high-level stack + CI skeleton + license gate
- Applied public exemplary standards (AGENTS, CONTRIBUTING, docs, templates, xde direction)
- Push executed (after LGTM)
- Repo made PUBLIC + branch protection enabled on main (1 review + CODEOWNERS + linear history + no force/delete)
- docs/branch-protection.md added + policy documented
- CI workflow enhanced for PR triggers (prepares status checks)
- Repo description + topics updated for accuracy
- Milestone v1.0.0 (#1) confirmed on GitHub (open)

- [x] Add Rule Clarification issue (#7) and PR (#9) - rule added to 5 files via squashed commit on feature branch
- [x] Enhance branch protection issue (#8) + applied (enforce_admins true + status checks for build-and-push)
- [ ] Update branch-protection.md and tracking with final links (in PR)

**Human verification and approval required before any remote action or merge to main.**
