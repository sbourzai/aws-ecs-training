#!/bin/bash
# Script to build and push Docker image to AWS ECR

# Set variables (replace these with your actual values)
AWS_ACCOUNT_ID="376129874106"
AWS_REGION="eu-west-1"
ECR_REPOSITORY_NAME="ecs-demo-repo"
IMAGE_TAG="latest"

# Colors for better readability
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== AWS ECR Docker Image Build and Push Script ===${NC}"
echo -e "${YELLOW}Region:${NC} $AWS_REGION"
echo -e "${YELLOW}Repository:${NC} $ECR_REPOSITORY_NAME"
echo -e "${YELLOW}Tag:${NC} $IMAGE_TAG"

# Step 1: Login to AWS ECR
echo -e "\n${GREEN}Step 1: Logging in to AWS ECR...${NC}"
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin "$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com"

# Step 2: Create ECR repository if it doesn't exist
echo -e "\n${GREEN}Step 2: Creating ECR repository if it doesn't exist...${NC}"
aws ecr describe-repositories --repository-names $ECR_REPOSITORY_NAME --region $AWS_REGION || \
aws ecr create-repository --repository-name $ECR_REPOSITORY_NAME --region $AWS_REGION

# Step 3: Build the Docker image
echo -e "\n${GREEN}Step 3: Building Docker image...${NC}"
docker build -t $ECR_REPOSITORY_NAME:$IMAGE_TAG .

# Step 4: Tag the Docker image for ECR
echo -e "\n${GREEN}Step 4: Tagging Docker image for ECR...${NC}"
ECR_REPOSITORY_URI=$(aws ecr describe-repositories --repository-names $ECR_REPOSITORY_NAME --region $AWS_REGION --query 'repositories[0].repositoryUri' --output text)
docker tag $ECR_REPOSITORY_NAME:$IMAGE_TAG $ECR_REPOSITORY_URI:$IMAGE_TAG

# Step 5: Push the Docker image to ECR
echo -e "\n${GREEN}Step 5: Pushing Docker image to ECR...${NC}"
docker push $ECR_REPOSITORY_URI:$IMAGE_TAG

echo -e "\n${BLUE}=== Build and Push Complete ===${NC}"
echo -e "${GREEN}Image successfully pushed to:${NC} $ECR_REPOSITORY_URI:$IMAGE_TAG"
echo -e "${YELLOW}You can reference this image in your ECS task definition.${NC}"