# pip fails inside `docker build` behind Zscaler

```shell
docker build --no-cache .
```

```shell
docker run --rm python:3.14-slim pip download --no-deps -d /tmp/dl hatchling
```

The build fails with `CERTIFICATE_VERIFY_FAILED`, the run succeeds. Zscaler re-signs pypi.org, OrbStack gives running containers the Zscaler root, build steps get nothing.
