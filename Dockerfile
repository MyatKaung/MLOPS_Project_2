# Base image
FROM python:3.10-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    COMET_API_KEY=VW42yLVEuqtmE7ZTRFNdFYe2E

# Install system dependencies
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

# Install dependencies
RUN pip install --no-cache-dir -e .

# Remove the training step for now
# RUN python pipeline/training_pipeline.py

EXPOSE 5000

# Create a script that trains the model if needed
RUN echo '#!/bin/bash \n\
if [ ! -f /app/models/model.pkl ]; then \n\
  echo "Training model..." \n\
  python pipeline/training_pipeline.py \n\
fi \n\
exec "$@"' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "application.py"]