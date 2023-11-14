
# Message Service Infrastructure

This repository contains the infrastructure and deployment configuration for the Message Service application using Kubernetes and AWS resources. Below is an overview of the components and their functions.

## Components

### Terraform
- `routes.tf`: Defines the routing tables for the network.
- `provider_config.tf`: Sets up the provider configuration for Terraform with AWS.
- `vpc_config.tf`: Configures the Virtual Private Cloud (VPC) settings.
- `iam_oidc.tf`: Sets up the IAM roles and OIDC identity provider.
- `nat.tf`: Configuration for the NAT gateway.
- `ig_config.tf`: Internet Gateway configuration.
- `eks.tf`: Defines the Elastic Kubernetes Service (EKS) cluster setup.
- `node_group.tf`: Configuration for EKS node groups.
- `subnet.tf`: Subnet definitions for the network.

### Ingress
- `ingress.yaml`: Defines the Ingress resources for the application.

### ServiceAccount
- `service_account.yaml`: Kubernetes ServiceAccount configuration for the application.

### PersistentVolumeClaim
- `pvc.yaml`: Defines Persistent Volume Claims for storage needs.

### Secret
- `secret.yaml`: Contains Secret configurations, typically for sensitive data like passwords or tokens.

### Jenkins
- `jenkins.groovy`: Jenkins pipeline script for CI/CD processes.

### Monitoring
- `service_alert_config.yaml`: Configuration for service alerts and monitoring.
- `alert_manager_secret.yaml`: Secret configurations for the alert manager.
- `service_monitor.yaml`: Service Monitor configuration for Prometheus.

### Autoscaling
- `message_service_disruption.yaml`: Pod Disruption Budget for the message service.
- `message_service_autoscaling.yaml`: Auto-scaling configurations for the message service.

### Logging
- `fluentd_config.yaml`: Configuration for Fluentd logging.

### Services
- `postgres-svc.yaml`: Service configuration for PostgreSQL database.
- `message_service-svc.yaml`: Service configuration for the Message Service.

### Deployments
- `message_service_deploy.yaml`: Kubernetes deployment configuration for the Message Service.
- `postgres-deploy.yaml`: Deployment configuration for the PostgreSQL database.

## Usage

Each directory contains specific configurations related to different aspects of the infrastructure and deployment setup. Apply these configurations as per your Kubernetes and AWS setup requirements.

## Contribution

Contributions are welcome. Please make sure to update tests as appropriate and follow the existing conventions in the repository.

## License

Specify your project's license here.
