FROM python:3.14-slim
RUN pip download --no-deps -d /tmp/dl hatchling
