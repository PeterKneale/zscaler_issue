#!/bin/sh
# Builds fail, runs succeed. The only difference is the CA bundle OrbStack injects into running containers.
set -u
cd "$(dirname "$0")"
echo "== DIAGNOSTIC: who signed the pypi.org certificate as seen from this Mac (Zscaler means SSL inspection is on)"
echo | openssl s_client -connect pypi.org:443 -servername pypi.org 2>/dev/null | openssl x509 -noout -issuer
echo
echo "== REPRO 1: docker build, pip inside a build step (expected to FAIL)"
docker build --no-cache --progress=plain . 2>&1 | grep -E '^#[0-9]+ [0-9.]+ ' | sed -E 's/^#[0-9]+ [0-9.]+ //' | grep -v -E '^(Collecting|Downloading|Saved|Successfully)' | tail -8
echo
echo "== REPRO 2: docker run, the same pip command in a running container (expected to SUCCEED)"
docker run --rm python:3.14-slim sh -c 'ls /etc/ssl/certs/orbstack-root.crt && pip download -q --no-deps --dest /tmp/dl hatchling && echo "pip OK in docker run"' 2>&1 | tail -3
