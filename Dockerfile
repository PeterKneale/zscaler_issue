FROM python:3.14-slim
RUN echo | openssl s_client -connect pypi.org:443 -servername pypi.org 2>/dev/null | openssl x509 -noout -issuer
RUN pip download --no-deps --dest /tmp/dl hatchling
