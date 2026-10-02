# Zscaler breaks pip inside `docker build`

Zscaler SSL inspection re-signs pypi.org with its own CA. Running containers trust it through the bundle OrbStack injects, build steps have no such bundle.

```shell
./repro.sh          # build fails with CERTIFICATE_VERIFY_FAILED, run succeeds
docker build .      # just the failure
```
