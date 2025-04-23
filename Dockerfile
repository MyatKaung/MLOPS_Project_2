FROM --platform=linux/arm64 python:3.10-slim

# Set environment variables including Comet ML API key
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

# Train the model
RUN python pipeline/training_pipeline.py

EXPOSE 5000

CMD ["python", "application.py"]