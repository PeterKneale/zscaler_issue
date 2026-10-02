# pip fails inside `docker build` behind Zscaler

**Fails**

```shell
docker build .
```

**Works**

```shell
docker run --rm python:3.14-slim pip download requests
```

Zscaler re-signs pypi.org. OrbStack gives running containers the Zscaler root, build steps get nothing, so the build dies with `CERTIFICATE_VERIFY_FAILED`.
