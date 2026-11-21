# What Coolify deploys for fluentsuite and fluentsuite-staging: the image GitHub Actions built for this commit (README.md).
ARG SOURCE_COMMIT
FROM ghcr.io/otaku-solutions/fluentsuite:sha-${SOURCE_COMMIT}
