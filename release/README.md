# Release image

The FluentSuite server is built on GitHub, never on the server that runs it. On every change to `main`,
`.github/workflows/image.yml` builds the root `Dockerfile`, publishes it to GHCR as
`ghcr.io/otaku-solutions/fluentsuite:sha-<commit>` and `:latest`, then moves the branch `release/fluentsuite` to that
commit.

Two Coolify apps run this one image: `fluentsuite` (fluentsuite.otakusolutions.io) and `fluentsuite-staging`
(fluentsuite-staging.otakusolutions.io). Both deploy from `release/fluentsuite` with `release/fluentsuite.Dockerfile`,
which only names the image published for that commit (`SOURCE_COMMIT`), so a deploy downloads the image and builds
nothing. The branch moves only after the image is published, so a deploy never asks for an image that is missing. Only
main's newest commit moves `latest` and the release branch, so re-running an older commit's workflow cannot roll the
apps back.

Two server settings make this work: each app has "Include source commit in build" on (otherwise `SOURCE_COMMIT` is
empty and the tag is `sha-`), and the server is logged in to `ghcr.io` with a token that can read packages, because the
package is private.
