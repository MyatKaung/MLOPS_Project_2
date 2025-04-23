# Base image with common dependencies
FROM python:3.10-slim as base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    COMET_API_KEY=VW42yLVEuqtmE7ZTRFNdFYe2E

# Install common dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libatlas-base-dev \
    libhdf5-dev \
    libprotobuf-dev \
    protobuf-compiler \
    python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -e .

# ARM64-specific build (for Apple Silicon)
FROM base AS builder-arm64
RUN --platform=linux/arm64 python pipeline/training_pipeline.py

# AMD64-specific build (for GKE)
FROM base AS builder-amd64
RUN --platform=linux/amd64 python pipeline/training_pipeline.py

# Final image that selects the right builder based on target platform
FROM base AS final

# Copy trained model from the appropriate builder
COPY --from=builder-arm64 /app/models /app/models-arm64
COPY --from=builder-amd64 /app/models /app/models-amd64

# Script to select the right model at runtime
RUN echo '#!/bin/bash \n\
ARCH=$(uname -m) \n\
if [ "$ARCH" = "x86_64" ]; then \n\
  cp -r /app/models-amd64/* /app/models/ \n\
elif [ "$ARCH" = "aarch64" ]; then \n\
  cp -r /app/models-arm64/* /app/models/ \n\
fi \n\
exec "$@"' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

EXPOSE 5000

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "application.py"]