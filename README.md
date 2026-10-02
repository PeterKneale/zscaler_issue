# pip fails inside `docker build` behind Zscaler

**Fails** (pip in a build step)

```shell
docker build --no-cache .
```

**Works** (same pip command in a running container)

```shell
docker run --rm python:3.14-slim pip download --no-deps -d /tmp/dl hatchling
```

Zscaler re-signs pypi.org. OrbStack gives running containers the Zscaler root, build steps get nothing, so the build dies with `CERTIFICATE_VERIFY_FAILED`.
