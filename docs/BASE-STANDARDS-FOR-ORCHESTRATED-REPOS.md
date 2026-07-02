# Base Standards for Orchestrated Repos (Public Exemplary Variant)

**Purpose**: This living document defines the minimum set of documentation, common architecture patterns, and AI collaboration standards that must exist on public exemplary repositories orchestrated under the XGIC portfolio. It is a sanitized, public-only variant of the authoritative standards.

Public exemplary repos (such as this one) receive this sanitized subset. Emphasis is on exemplary open-source process, agent ergonomics, living guides, external-contributor simulation, xde standard, and strict adherence to security boundaries.

**Last major update**: 2026 — Public variant established for GitLab exemplary and future public launches. Added emphasis on human review gate, platform tracking, Conventional Commits, xde (no Makefiles), and zero private leakage.

---

## Hard Security Rule (Non-Negotiable — Zero Exposure)

**Zero exposure (absolute)**: No mentions, names, details, architectures, experiments, timelines, strategies, links, or any information that would reveal the existence, identity, or structure of any private repositories or private coordination hubs may ever be placed in any public XGIC repository (this repo or any other public one). This includes documentation, prompts, code, issues, PRs, READMEs, or any Grok output.

All detailed coordination, private project work, and anything involving private repos or sensitive strategy lives *exclusively* in the authoritative private AI orchestration repository.

Public repositories and public sessions must remain completely silent on private details and structures. Only the most abstract high-level references are permissible when essential ("private project coordination and full details live in the private XGIC Foundation repository").

Violations are treated as security incidents. Human review is mandatory to prevent leakage.

## Mandatory Sanitization Rule (Non-Negotiable — Core of Hard Security)

**Never include private GitLab issue numbers (e.g. #5, #2), private URLs (e.g. gitlab.xorengames.com), private repo paths, or direct links to private issues/MRs in any public file, source comment, commit message, PR body, issue, changelog, or artifact.**

- Replace with high-level text.
- Good examples:
  - "coordinating the GitLab migration effort"
  - "public exemplary launches"
  - "High-level coordination for the GitLab migration effort and public exemplary launches"
- Reference only public GitHub issues/PRs from *this repository*.
- Add explicit "Sanitization" checklist item to PR/issue templates and playbooks.
- Enforce via pre-change verification, human review, and periodic leak scans (grep for #\d+ in coordination contexts, private domains).
- Violations must be corrected immediately.

---

## Mandatory Human Review Gate Before Main (Beta-Era Rule)

**While Grok Build is in beta, every change must receive at least one explicit human code review and approval before it is pushed or merged to the primary branch (main).**

- "Code review" includes docs, AGENTS.md, playbooks, scripts, stack definitions, CI, and source.
- The human must inspect the proposal/diff, run verification steps (lint where applicable, stack validation, security/leakage scan, manual read for tone and boundaries), and give explicit approval (LGTM comment, PR approval, or recorded note) **before** any push or merge to main.
- For public exemplary repos: real PR + approval(s), consistent with the external-contributor-simulation model.
- Enforcement: branch protection (≥1 required reviews, no direct main pushes, linear history), PR templates, AGENTS.md, and this base set.
- Grok always produces clean professional draft artifacts (Draft PRs carrying explicit "Review and approval required before any remote action or merge to main" language in the body) and pauses for approval after every remote action proposal.
- **Mandatory human code review in platform UI**: All Pull Requests must undergo explicit human code review performed directly in the GitHub web interface. Grok prepares drafts but never approves or merges its own work.
- **Attribution**: Use actual usernames when describing specific human actions performed in the platform.

This rule strengthens oversight and pure flow requirements.

**Review and approval required before any remote action or merge to main.**

---

## Minimum Required Artifacts (The Base Set)

Every public exemplary orchestrated repo must have (at minimum) the following:

1. **Hard security / private leakage rule** (this document and AGENTS.md contain the public form).
2. **Pure flow + branch protection**:
   - Strict GitHub Flow.
   - `main` is always the stable single source of truth.
   - All work on short-lived branches. Integration exclusively via Pull Requests.
   - Merge only after required human review(s) + all automated checks pass.
   - Branch protection on `main`.
3. **Standard labels and templates**:
   - Consistent labels for type, priority, status, area, review.
   - `.github/ISSUE_TEMPLATE/` and `PULL_REQUEST_TEMPLATE.md` with standard fields, checklists, and the exact gate sentence.
4. **The human review gate** (documented in CONTRIBUTING.md + AGENTS.md).
5. **Root project instruction file**: `AGENTS.md` (contains collaboration principles, session startup checklist, hard security rule, human review gate, commit expectations, xde standard, and references to base standards / playbooks).
6. **CONTRIBUTING.md** (placed at `.github/CONTRIBUTING.md`): Covers GitHub Flow, the review gate, AI/Grok usage with human gates + clean professional draft artifacts (exact gate sentence; no "ai-draft" labels), tone, commit discipline, and base set expectations.
7. **README.md**: Purpose, quick start (including xde / Compose usage), security note, high-level status, and links back to coordination.
8. **docs/ skeleton** (minimum):
   - `orchestration-workflow.md` (or development-workflow.md): Commit discipline, pre-change checks, branching/PRs + review gate, positive framing, xde usage, how/when to update docs.
   - `architecture.md`: High-level mental model of the repo, key abstractions, invariants, public/private boundary note.
   - `grok-playbooks.md`: Concrete step-by-step workflows for common (especially AI-assisted) tasks.
   - `BASE-STANDARDS-FOR-ORCHESTRATED-REPOS.md` (this public variant).
9. **Lightweight AI memory and tracking** (for heavy Grok Build use):
   - High-level distillation, session context, and informal TODOs live in the primary plan and platform issues/tasks.
   - Temporary Grok Build status reports live in `.xgic/grok-build/status-report.md` (using the public template; always gitignored and never committed).
10. **.gitignore**: Comprehensive (secrets, env, runtime data volumes, AI local overrides, Python caches, editor noise, etc.). Model after reference public patterns.
   - **Mandatory**: Include `.xgic/` (temporary Grok Build status reports and coordination artifacts). Never commit `.xgic/`.
   - Support for mandatory session status reports using Session ID "XGIC GitLab", saved to `.xgic/grok-build/status-report.md` using the public template. Document triggers in AGENTS.md.
11. **Commit discipline & culture**:
    - Detailed Conventional Commits: `<type>(<scope>): <short imperative subject>`.
    - Body explains the change and "why".
    - Atomic and complete.
    - Linting/verification + docs updates in same commit where relevant.
    - Positive, constructive, forward-looking framing.
    - **Squash related small changes**: When a high number of small related changes are made, squash them into one fully detailed Conventional Commit that documents all modifications. This rule does not apply to completely unrelated changes, which must be submitted in separate merge requests or pull requests.
    - **Initial commits in bootstraps**: Must be preceded by a platform tracking issue describing the bootstrap. The commit message must clearly identify it as the "Initial commit", state the project name and purpose, list the key files and structure introduced, describe the setup (base set, standards, xde, etc.), reference the issue, and use positive framing. Grok drafts; explicit human LGTM before committing. **Review and approval required before any remote action or merge to main.**
12. **xde as the standard for container / environment orchestration tasks (no Makefiles)**:
    - `xde` is the preferred single interface.
    - No Makefiles or legacy make targets.
    - When container/env tasks arise: use `xde` (extend or contribute generalizations back to the shared xde library as needed).
    - Strong safety primitives and clear next-step guidance.
13. **Grok usage rules**:
    - For coordination, multi-repo, strategy, or boundary work: always restate the full Hard Security Rule.
    - Use clean professional draft issues/PRs carrying the exact gate sentence.
    - Mandatory human verification/approval on every remote action and before anything lands on main.
    - All PRs require human code review in the GitHub interface.
    - Update AGENTS.md and playbooks as part of relevant changes.
    - **Documentation Professionalism**: Use professional language only. Avoid labels like "**Positive update:**". Do not reference ruleset bypass details unless the changes specifically target the rulesets.
    - **Platform-native tracking**: Draft issues/PRs fully in Grok (complete body with context, plan, checklists, exact gate sentence), receive explicit human LGTM, then create using native tools (gh after search_tool for MCP schemas if used). Local lightweight files are for high-level distillation only.
    - **Full Artifacts**: Include assignments (e.g. @xgic), consistent labels (type/, priority/, status/, area/, review/, grok/), milestones (for releases, major/epics/coordinated work; not for all small items).
    - Reference high-level coordination for the GitLab migration effort and public exemplary launches from artifacts where relevant.

- **Milestones**: Create draft milestones for releases, major work, epics, or coordinated efforts per platform best practices and semantic versioning. Every release must pass tests, receive approvals, include completed professional artifacts. Human LGTM before remote creation.

---

## Public vs Private Variants

- **Public exemplary repositories**: This sanitized subset only. No private mentions, structures, timelines, or links. Full coordination for the public surface lives inside the public repo. Cross-reference the private XGIC Foundation repository only at the highest abstract level.
- **Private repositories**: Full base set (domain-extended as needed).
- The private XGIC Foundation repository is the authoritative source for the complete standards and cross-cutting orchestration playbooks.

---

## Bootstrap & Enforcement

New public exemplary repo bootstrap (high-level):
1. Pure flow + branch protection.
2. Add the minimum artifacts (sanitized public variants).
3. Apply comprehensive .gitignore.
4. Add AGENTS.md (security rule, review gate, xde standard, links to playbooks).
5. Add xde direction (no Makefiles) in workflow and CONTRIBUTING.
6. Add memory triad and grok-playbooks skeleton.
7. Human review of the initial base set.
8. Record at high level in coordination trackers and link issues for the GitLab migration effort and public exemplary launches.

Enforcement via human gates, branch protection, PR templates, and periodic review.

When patterns evolve, the base standards are updated first; downstream public exemplary repos adopt via normal PR process.

**Every public exemplary repo must embody these standards visibly.** This is how we demonstrate excellence, security, and agent productivity to the community.

**Review and approval required before any remote action or merge to main.**
