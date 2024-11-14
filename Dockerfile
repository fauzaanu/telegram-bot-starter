FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:0.4.0 /uv /bin/uv

ENV PYTHONUNBUFFERED=1
ENV UV_HTTP_TIMEOUT=120

# Copy the application into the container.
COPY . /app

# Install the application dependencies.
WORKDIR /app
RUN uv sync --frozen --no-dev --compile-bytecode

EXPOSE 8443
