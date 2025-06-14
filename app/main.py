# FastAPI entrypoint

# This is a simple FastAPI application that lists S3 buckets
# when accessed at the /list-buckets endpoint.
# It is designed to run in an AWS ECS Fargate environment.
# It uses the boto3 library to interact with AWS services.
# Ensure you have the necessary permissions to list S3 buckets
# when deploying this application.
# and that the AWS credentials are configured correctly in the environment.
# The application also has a root endpoint that returns a simple message
# indicating that the service is running.
# Import necessary libraries
# Import FastAPI and boto3 for AWS interactions

from fastapi import FastAPI
import boto3
# Create a FastAPI instance
app = FastAPI()


# Define the root endpoint and a bucket listing endpoint
@app.get("/")
def read_root():
    return {"message": "FastAPI running in ECS Fargate"}

@app.get("/list-buckets")
def list_buckets():
    s3 = boto3.client('s3')
    buckets = s3.list_buckets()
    return {"buckets": [b['Name'] for b in buckets['Buckets']]}
