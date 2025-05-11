#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Set variables
AWS_REGION="us-east-1"
ECR_REPOSITORY_NAME="ecs-demo-repo"
IMAGE_TAG="latest"

echo -e "${GREEN}=== Starting Deployment Process ===${NC}"

# Step 1: Build and Push Docker Image
echo -e "\n${YELLOW}Step 1: Building and pushing Docker image...${NC}"
./scripts/build-and-push.sh

# Check if build-and-push was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to build and push Docker image${NC}"
    exit 1
fi

# Step 2: Get the ECR Image URI
echo -e "\n${YELLOW}Step 2: Getting ECR image URI...${NC}"
ECR_REPOSITORY_URI=$(aws ecr describe-repositories --repository-names $ECR_REPOSITORY_NAME --region $AWS_REGION --query 'repositories[0].repositoryUri' --output text)
FULL_IMAGE_URI="${ECR_REPOSITORY_URI}:${IMAGE_TAG}"

# Step 3: Initialize Terraform
echo -e "\n${YELLOW}Step 3: Initializing Terraform...${NC}"
cd terraform
terraform init

# Step 4: Plan Terraform changes
echo -e "\n${YELLOW}Step 4: Planning Terraform changes...${NC}"
terraform plan -var="container_image=${FULL_IMAGE_URI}" -out=tfplan

# Step 5: Apply Terraform changes
echo -e "\n${YELLOW}Step 5: Applying Terraform changes...${NC}"
terraform apply tfplan

# Step 6: Output the results
echo -e "\n${GREEN}=== Deployment Complete ===${NC}"
echo -e "You can access your application at the ALB DNS name shown above."