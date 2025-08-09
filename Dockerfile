FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Avoid cache purge by adding requirements first
ADD ./pyproject.toml ./pyproject.toml

RUN pip install uv wheel
RUN uv pip install -r pyproject.toml --system

# Add the rest of the files
COPY . /app
WORKDIR /app