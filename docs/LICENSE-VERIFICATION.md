# Apache 2.0 License Verification

**Status**: ✅ Verified suitable for all supported production use cases.  
**Date**: 2026-06-23

## Scope of This Verification

This verification applies **exclusively** to the licensing of the artifacts maintained in this repository:

- Dockerfiles and image build definitions (if any custom layers or optimization wrappers on top of official GitLab images)
- Multi-container Docker Compose stack definitions (`docker-compose*.yml`)
- Configuration templates and examples (version-pinned, config-driven)
- CI/CD definitions for building and publishing images
- Supporting documentation, scripts (where used), and orchestration helpers
- All source code, examples, and published materials derived from this repo

This license **does not** cover:
- GitLab Enterprise Edition (EE) software itself (provided via official `gitlab/gitlab-ee` container images)
- PostgreSQL, Redis, or other supporting service images
- Any user data, secrets, or runtime configuration generated during deployment

## Supported Use Cases — Verified

Apache License 2.0 has been reviewed against the following intended production and educational uses:

1. **Building and publishing highly optimized production Docker images** for current stable GitLab EE.
2. **Multi-container Compose stacks** (GitLab EE + PostgreSQL + supporting services such as Redis, etc.).
3. **GHCR image distribution** — publishing versioned images to `ghcr.io/xgic/...`.
4. **Deployments** to:
   - On-premises Docker Compose
   - Kubernetes (via the Compose definitions as reference or converted manifests)
   - AWS (EC2, ECS, EKS) and other cloud providers
5. **Reuse in tutorials, white papers, multimedia materials, and living educational content**.

## Verification Outcome

✅ **Apache 2.0 is valid and appropriate** for the above uses.

### Key Reasons

- Apache 2.0 is a permissive open source license explicitly designed to allow commercial use, modification, reproduction, public display/performance, sublicensing, and distribution in both Source and Object form (including container images).
- It includes an explicit patent grant.
- It places minimal conditions: preserve copyright/attribution notices, include a copy of the license with distributions, and mark modified files.
- Publishing container images (as "Object form") and Compose definitions (as configuration/source) is a standard, well-accepted practice under Apache 2.0. Many high-profile Apache-licensed projects and tools publish to Docker Hub, GHCR, and other registries.
- The use cases listed (Compose orchestration, cloud deployments, educational reuse, derived documentation) are fully compatible with the license grant.

References for common practice (publicly available):
- Docker project itself is Apache 2.0 and widely distributed as images.
- Numerous Apache 2.0 projects publish production images and stacks to GHCR and use them in commercial and educational contexts without issue.

## Important Caveats and User Responsibilities

1. **GitLab EE Licensing (Separate)**: GitLab EE is commercial software. Production use of GitLab EE (even via the official Docker image) requires a valid GitLab subscription/license key. The Apache 2.0 license on *this* repository grants no rights to GitLab EE. Users are responsible for complying with GitLab's terms when running EE.

2. **Image Provenance**: This project provides optimized definitions and stacks. When publishing derived images, ensure clear labeling that the base image is the official GitLab EE image and that any customizations are covered under Apache 2.0.

3. **Attribution**: When redistributing or including content from this repo, retain the Apache 2.0 license notice and any NOTICE file contents.

4. **No Warranty**: As stated in the license, the work is provided "AS IS" without warranties. Production deployments should include appropriate testing, monitoring, and backup strategies.

## Recommendation

The Apache 2.0 license currently in the root of the repository is the correct choice and fully supports the mission of this public exemplary repository.

**This verification gate is satisfied for the purposes of preparing the initial public release and GHCR publishing**, subject to:
- Final human review and explicit approval of this document and the overall bootstrap.
- Successful first stable production-ready release.
- Confirmation of GitLab EE image usage compliance in the target environments.

Further updates to this verification will be made if the supported use cases expand.

## v1.0.0 Refresh (2026-06-23)

Re-confirmed for the first stable production release (v1.0.0 per milestone #1).

- Apache 2.0 remains fully suitable for the generalized production definitions, GHCR publishing, and all listed deployment/educational use cases.
- Common practice in 2026: Many Apache 2.0 OSS projects use GHCR successfully for production container distribution with GitHub Actions (unlimited pulls for public, fine-grained permissions).
- No changes to caveats: Upstream GitLab EE licensing is separate and user responsibility.

See primary coordination for full context.

---

**Coordination references**: High-level for the GitLab migration effort and public exemplary launches; v1.0.0 milestone #1 (public).

