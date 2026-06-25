# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-06-24

### Added
- Full public exemplary base set: AGENTS.md, BASE-STANDARDS, CONTRIBUTING, templates, etc.
- Generalized production GitLab EE stack with external PostgreSQL and supporting services.
- Configuration-driven approach with version pinning.
- CI/CD for GHCR image builds (multi-platform).
- Branch protection via ruleset (PR + code owners + linear history + status checks).
- Documentation for production recommendations (resources, backups, HTTPS, profiles).
- Rule clarifications for squash commits, human review gate, professionalism.
- Attribution and platform-native tracking requirements.

### Changed
- Updated to use GitHub Rulesets for main protection.
- Professional tone and short gate references across docs.

### Notes
- First stable v1.0.0 release, pinned to gitlab/gitlab-ee:18.11.6-ee.0
- Reference image published to GHCR.
- See PR #10 for rules propagation, PR #9 for initial clarifications.
- Milestone: https://github.com/xgic/gitlab/milestone/1
- High-level coordination for the GitLab migration effort and public exemplary launches (descriptive references only).

Follow the mandatory human review gate before any remote action or merge to main — see AGENTS.md and BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md.
