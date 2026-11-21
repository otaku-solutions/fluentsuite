# What a deploy of the release branch runs: the image GitHub Actions built for this commit (README.md).
ARG SOURCE_COMMIT
FROM ghcr.io/otaku-solutions/fluentsuite:sha-${SOURCE_COMMIT}
