# Dockerfile for service
# This Dockerfile sets up a FastAPI application with AWS SDK (boto3) and Uvicorn as the ASGI server.
# It uses a slim Python 3.11 image to keep the image size small.
FROM python:3.11-slim

# The application code is copied into the /app directory, and the necessary Python packages are installed.
WORKDIR /app
COPY ./app .


# Install system dependencies required for the application.
# RUN apt-get update && apt-get install -y python3-distutils python3-dev

# Install python dependencies required for the application.
# COPY ./requirements.txt /app/requirements.txt
#RUN pip install --upgrade pip setuptools wheel packaging
RUN pip install -r requirements.txt

# The application is run using Uvicorn, listening on port 80.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
EXPOSE 80



# To build the Docker image, run:
# docker build -t fastapi-fargate .

# To run the Docker container, use:
# docker run -d -p 80:80 fastapi-fargate
# docker run --env-file .env -p 80:80 fastapi-fargate #only for local dev


# To push the image to AWS ECR, tag it and use the AWS CLI:
# aws ecr create-repository --repository-name fastapi-fargate --region us-east-1
# aws ecr get-login-password --region us-east-1| docker login --username AWS --password-stdin 177099687008.dkr.ecr.us-east-1.amazonaws.com
# docker tag fastapi-fargate 177099687008.dkr.ecr.us-east-1.amazonaws.com/fastapi-fargate:latest
# docker push 177099687008.dkr.ecr.us-east-1.amazonaws.com/fastapi-fargate:latest


# Note: Ensure that the 'app' directory contains your FastAPI application code, including 'main.py'.
# This Dockerfile is designed to be used in a development or production environment where you want to deploy a FastAPI application with AWS integration.