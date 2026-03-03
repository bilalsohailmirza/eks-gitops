# EKS GitOps Infrastructure with Terraform & ArgoCD

This repository contains the **Infrastructure as Code (IaC)** and **CI/CD configurations** required to deploy a production-ready Amazon EKS (Elastic Kubernetes Service) cluster. The project leverages Terraform for provisioning, GitHub Actions for automation, and ArgoCD for GitOps-based application delivery.

---

## 🏗 Architecture Diagram

![Architecture Diagram](/assets/architecture.png)

---

## Key Features

### 1. Infrastructure as Code (Terraform)
* **Remote State Management:** S3 bucket backend with DynamoDB locking for state consistency across teams.
* **VPC Networking:** Custom VPC with public/private subnets, NAT Gateways, and Internet Gateways.
* **EKS Cluster:** Managed Node Groups with automated scaling and OIDC provider integration.
* **Add-ons:** Automatic provisioning of AWS Load Balancer Controller and VPC CNI.

### 2. Security & Identity
* **ECR Access:** GitHub Actions configured with specific IAM roles and policies to securely push images.
* **EKS Pod Identity:** Mapping AWS IAM roles to Kubernetes service accounts for fine-grained pod-level permissions.
* **IAM Roles:** Dedicated roles for cluster management, node groups, and application-specific tasks.

### 3. CI/CD & GitOps
* **GitHub Actions:** Automated workflows for Terraform linting/validation and Docker image builds.
* **ArgoCD:** GitOps-oriented automated rollouts that monitor the manifest repository for state synchronization.
* **ECR Registry:** Private container registry for secure image storage.

---

## 📁 Repository Structure

```text
├── envs/                # Multiple environments
│   ├─ dev/               # Development Environment (example)
│   ├── eks/
│   ├─── iam/
│   ├─── values/
│   ├─── argocd.tf
    |
    ├── vpc/                # Network stack (VPC, Subnets, NAT)
│   ├─── main.tf                
│   ├─── outputs.tf             
│   ├─── providers.tf           
│   ├─── state.tf               
│   ├─── variables.tf           
│   ├─── vpc.tfvars             
│   ├── dev.tfvars          # Not pushed to GitHub
│   ├── state.config        # Not pushed to GitHub
│   └─ global/              # Cluster endpoints and ARNs
│   └── ecr/                # ECR to be used in all environments
│   └── iam/                # Global IAM configs
│   └── s3/                 # S3 bucket config to manage all environments 
└── README.md