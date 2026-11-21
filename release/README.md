# Release image

The FluentSuite server image is built on GitHub, not on the host that runs it. On every change to `main`,
`.github/workflows/image.yml` builds the root `Dockerfile` and publishes it to GHCR as
`ghcr.io/otaku-solutions/fluentsuite:sha-<commit>`. Its release job then points `:latest` and the branch
`release/fluentsuite` at main's newest commit whose image is published.

To deploy, build `release/fluentsuite.Dockerfile` from the `release/fluentsuite` branch with the build argument
`SOURCE_COMMIT` set to that branch's commit. It only names the published image, so the deploy downloads it and
compiles nothing, and the branch never points at a commit whose image is missing. The host needs a `ghcr.io` login
that can read the package.
