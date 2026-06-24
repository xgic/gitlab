# =============================================
# XGIC GitLab — Reference Production Image
#
# This Dockerfile provides a high-level entry point for building
# an optimized or lightly customized GitLab EE image layer.
#
# In practice, the primary mechanism is the official gitlab/gitlab-ee
# image consumed via the Compose stack (see docker-compose.yml).
#
# Use this file for:
# - Thin wrapper layers (labels, health, entrypoint tweaks)
# - CI demonstration of GHCR publishing path
# - Future build-time optimizations or config injection
#
# Version pinning is handled via build-arg and compose .env.
#
# Coordination: #5, #2
# Human verification and approval required before any remote action or merge to main.
# =============================================

ARG GITLAB_VERSION=17.11.0-ee.0  # v1.0.0 release pin

FROM gitlab/gitlab-ee:${GITLAB_VERSION}

# Example: add labels for traceability
LABEL org.opencontainers.image.title="XGIC GitLab EE (optimized reference)"
LABEL org.opencontainers.image.description="Generalized configuration-driven GitLab EE production stack"
LABEL org.opencontainers.image.source="https://github.com/xgic/gitlab"
LABEL org.opencontainers.image.licenses="Apache-2.0"

# Example production hardening / config injection can go here.
# Keep this layer minimal; heavy customization belongs in omnibus config
# or the Compose orchestration layer.

# Example resource / security notes (apply at runtime via compose or orchestrator)
# - Use read-only root where possible
# - Drop capabilities in compose if overriding entrypoint

# Healthcheck (example — adjust for your GitLab version and setup)
# HEALTHCHECK --interval=30s --timeout=10s --start-period=300s --retries=3 \
#   CMD curl -f http://localhost/-/health || exit 1

# Default remains the official entrypoint/cmd from the base image.
