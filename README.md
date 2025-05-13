THERE IS IS BUG IN THE CONFIGURATION WE GONNA TRY TO FIND IT TOGETHER 😁

# AWS ECS Demo Application

This repository contains a simple Node.js API application designed to demonstrate AWS ECS deployment. It includes Docker containerization, ECR image publishing, and Terraform code for deploying a complete ECS cluster within the AWS Free Tier.

## Project Structure

```
.
├── src/                      # Application source code
│   ├── index.js              # Main application entry point
│   ├── routes/               # API routes
│   └── services/             # Business logic 
├── terraform/                # Terraform deployment code
│   ├── main.tf               # Main Terraform configuration
│   ├── variables.tf          # Input variables
│   └── modules/              # Terraform modules
│       ├── vpc/              # VPC configuration
│       ├── security/         # Security groups
│       ├── ecr/              # ECR repository
│       └── ecs/              # ECS cluster, services, tasks
├── scripts/                  # Utility scripts
│   └── build-and-push.sh     # Script to build and push Docker image to ECR
├── docs/                     # Documentation
│   └── aws-ecs-presentation.md # ECS presentation for beginners
├── Dockerfile                # Multi-stage Dockerfile
├── docker-compose.yml        # Docker Compose for local development
├── package.json              # Node.js dependencies
└── README.md                 # Project documentation
```

## Prerequisites

- AWS Account with free tier eligibility
- AWS CLI configured with appropriate credentials
- Docker installed locally
- Node.js v14 or later
- Terraform v1.0 or later

## Getting Started

### Local Development

1. Install dependencies:
   ```bash
   npm install
   ```

2. Start the development server:
   ```bash
   npm run dev
   ```

3. Or run with Docker Compose:
   ```bash
   docker-compose up
   ```

4. Access the API at http://localhost:3000

### Available Endpoints

- `GET /` - Welcome message
- `GET /api/health` - Basic health check
- `GET /api/health/detailed` - Detailed health information
- `GET /api/info` - API information
- `GET /api/info/system` - System information
- `GET /api/info/metadata` - Container metadata

### Building and Pushing to ECR

1. Update the variables in `scripts/build-and-push.sh` with your AWS account details.

2. Make the script executable:
   ```bash
   chmod +x scripts/build-and-push.sh
   ```

3. Run the script:
   ```bash
   ./scripts/build-and-push.sh
   ```

### Deploying with Terraform

1. Navigate to the terraform directory:
   ```bash
   cd terraform
   ```

2. Initialize Terraform:
   ```bash
   terraform init
   ```

3. Plan the deployment:
   ```bash
   terraform plan
   ```

4. Apply the configuration:
   ```bash
   terraform apply
   ```

5. After deployment, Terraform will output:
   - ECR Repository URL
   - Load Balancer DNS name
   - ECS Cluster name

## Free Tier Considerations

This project is designed to stay within AWS Free Tier limits:
- Uses t2.micro instances for ECS
- Minimizes NAT Gateway usage (which is not free)
- Uses minimal EBS storage
- Configures auto-scaling to maintain instance count

## Cleanup

To avoid unexpected charges, remember to destroy resources when not needed:

```bash
terraform destroy
```