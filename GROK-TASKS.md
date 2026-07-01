# GROK-TASKS — XGIC GitLab (public exemplary)

Lightweight informal task tracker for ideas, reminders, and work not yet ready for GitHub issues.

Use this file for distillation. Authoritative tracking lives on the GitHub platform (public issues only; high-level references to coordination efforts).

## Next / In Progress

- [x] Human review and LGTM of bootstrap artifacts (received)
- [x] Platform issue creation (#1) with full body + gate sentence
- [x] Initial commit (ccc70e3) after LGTM with detailed message using high-level coordination references only.
- [x] Explicit human LGTM for `git push origin main` (bootstrap push executed after prior LGTM; see commits)
- [x] Verify/refresh LICENSE-VERIFICATION completeness and cross-refs for v1.0.0 (Apache 2.0 gate) — refreshed with 2026 confirmation + milestone ref
- [x] Populate/advance milestone v1.0.0 (#1) per new mandatory rule
- [x] Prepare for GHCR v1.0.0 release: pinned to gitlab/gitlab-ee:18.11.6-ee.0, updated pins/comments, added CHANGELOG.md, drafted release. Ready for tag.
- [x] Propagate full current rules (PR #10): updated AGENTS, BASE-STANDARDS, branch-protection (ruleset high-level), etc. LGTM on draft, PR created for human UI review.
- [x] Expand production stack (backups, HTTPS/TLS, resources, profiles, full config-driven; stack/ dir) — committed
- [x] Enhance CI/CD (GHCR, multi-platform via QEMU/Buildx, PR validation) — platforms + PR trigger

- [x] Implement mandatory session status report standard (PR #11): Session ID "XGIC GitLab", .xgic/grok-build/status-report.md, updated AGENTS/BASE-STANDARDS/.gitignore. LGTM on draft, PR created. Build checks fixed (removed inline comment in workflow build-args that caused invalid image ref for 18.11.6 tag). LGTM received for fix.

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
- [x] Update branch-protection.md and tracking with final links (PRs #9/#10/#11, issues #7/#8; enforcement history section; verified via gh api on chore/sync-protection-tracking-links)
- [x] PR #12 reviewed, approved, and merged by @xgic via GitHub web UI (https://github.com/xgic/gitlab/pull/12, merge commit 51f5684). Tracking sync and updates landed on main. Full rules propagation complete.
- [x] Enforce mandatory sanitization + Session ID "XGIC GitLab" (chore/enforce-mandatory-sanitization): removed all private coordination refs, replaced with high-level text. Added full rule + playbook + checklist. LGTM received; PR #13 created and merged by @xgic via GitHub web UI (merge commit 321a984).
- [x] Fix CI build arg parsing (chore/fix-docker-build-arg-parsing): prevent invalid image ref by isolating comments and adding version validation. LGTM received; PR #14 created and merged by @xgic via GitHub web UI (merge commit d6988f5). Build issue from run 28164666182 resolved.
- [x] Session status report generated (this trigger): .xgic/grok-build/status-report.md refreshed with Session ID "XGIC GitLab", fresh UTC, full positive summary of PR #13/#14 work and merges by @xgic. Local state confirmed clean on main.
- [x] Gate text update (chore/update-gate-text-remove-human-prefix): tracking issue #15 created with new text; branch created; all files updated (templates/BASE first); PR #16 created with new gate in body. Reviewed, approved, and merged by @xgic via GitHub web UI (merge commit b33b564). Stale local branches cleaned.
- [x] Prepare for Switching to Remote Work: confirmed committed and clean (no uncommitted, no unignored temps); no draft needed; stale branches removed; only main; session status report generated; repo ready for clone to laptop for remote work.

**Review and approval required before any remote action or merge to main.**
