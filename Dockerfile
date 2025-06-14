# Dockerfile for service
# This Dockerfile sets up a FastAPI application with AWS SDK (boto3) and Uvicorn as the ASGI server.
# It uses a slim Python 3.11 image to keep the image size small.
FROM python:3.11-slim

# The application code is copied into the /app directory, and the necessary Python packages are installed.
WORKDIR /app
COPY ./app /app

# Install python dependencies required for the application.
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# The application is run using Uvicorn, listening on port 80.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
EXPOSE 80



# To build the Docker image, run:
# docker build -t fastapi-fargate .
# To run the Docker container, use:
# docker run -d -p 80:80 fastapi-fargate
# Note: Ensure that the 'app' directory contains your FastAPI application code, including 'main.py'.
# This Dockerfile is designed to be used in a development or production environment where you want to deploy a FastAPI application with AWS integration.