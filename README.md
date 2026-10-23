# infra-terraform

Shared Terraform configuration for core infrastructure.

## Modules

- `vpc` — VPC, subnets, and route tables.
- `eks` — EKS control plane and node groups.
- `rds` — Aurora Postgres instances.

## Usage

```sh
terraform init
terraform plan -var-file=envs/prod.tfvars
terraform apply -var-file=envs/prod.tfvars
```

## State

Remote state is stored in the shared S3 backend with DynamoDB locking.
