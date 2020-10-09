#!/bin/bash

# Configure preprocessing
BUCKET=
aws s3 cp kmeans_preprocessing.py s3://$BUCKET/mnist_kmeans_example/processing_code/kmeans_preprocessing.py

# Create SageMaker Role for KFP to Assume

TRUST="{ \"Version\": \"2012-10-17\", \"Statement\": [ { \"Effect\": \"Allow\", \"Principal\": { \"Service\": \"sagemaker.amazonaws.com\" }, \"Action\": \"sts:AssumeRole\" } ] }"
aws iam create-role --role-name kfp-example-sagemaker-execution-role --assume-role-policy-document "$TRUST"
aws iam attach-role-policy --role-name kfp-example-sagemaker-execution-role --policy-arn arn:aws:iam::aws:policy/AmazonSageMakerFullAccess
aws iam attach-role-policy --role-name kfp-example-sagemaker-execution-role --policy-arn arn:aws:iam::aws:policy/AmazonS3FullAccess
aws iam get-role --role-name kfp-example-sagemaker-execution-role --output text --query 'Role.Arn'
