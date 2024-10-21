<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![BSD-3-Clause License][license-shield]][license-url]

---

<br />
<div align="center">
    <p>Copyright (c) 2024, <a href="https://github.com/programmingwithalex">GitHub@programmingwithalex</a></p>


  <h3 align="center">AWS ECS Service Connect</h3>

  <p align="center">
    Enable Service Connect with AWS ECS to create a microservices architecture.
    <br />
    <a href="https://github.com/programmingwithalex/aws_ecs_service_connect">View Demo</a>
    ·
    <a href="https://github.com/programmingwithalex/aws_ecs_service_connect/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/programmingwithalex/aws_ecs_service_connect/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#series-outline">Series Outline</a>
      <ul>
        <li><a href="#aws-components">AWS Components</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <ul>
            <li><a href="#software">Software</a></li>
            <li><a href="#aws">AWS</a></li>
            <li><a href="#cmd-line">CMD Line</a></li>
          </ul>
      </ul>
    </li>
    <li><a href="#aws-cdk-commands">AWS (CDK) Commands</a></li>
    <li><a href="#refences">References</a></li>
  </ol>
</details>

## Series Outline

1. Create [ECS components](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/Welcome.html) (Clusters, Task Definitions, & Services)

2. Enable [Service Connect](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/service-connect.html) for ECS Services using AWS Cloud Map

3. Push Flask web apps from [ECR Repos](https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html) as Docker Images to Each ECS Service to Test Connectivity

4. Automate deployments with [AWS CDK](https://docs.aws.amazon.com/cdk/v2/guide/home.html)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### AWS Components

- Virtual Private Cloud (VPC)
- NAT Gateway & Internet Gateway (IGW)
- Elastic Container Registry (ECR)
- Elastic Container Service (ECS)
- ECS Clusters
- ECS Services
- ECS Task Definitions
- Cloud Map
- Application Load Balancer (ALB)
- AWS Cloud Development Kit (CDK)
  - written in Python


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

#### Software

- Python: version requirement determined by [AWS CLI requirement](https://github.com/aws/aws-cli) and optionally [AWS CDK requirement](https://github.com/aws/aws-cdk)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/): account not required, just installation

#### AWS

- create [AWS IAM user account](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) than can be configured with the AWS CLI

#### CMD Line

- follow setup guides for [`aws-cli`](https://github.com/aws/aws-cli?tab=readme-ov-file#getting-started) if not already configured

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## AWS Cloud Development (CDK)

### Installation (Windows)

- [download](https://nodejs.org/en/download/prebuilt-installer) `node.js`, includes `npm` which is necessary to install the `aws-cli`
- [install](https://docs.aws.amazon.com/cdk/v2/guide/getting_started.html) `aws-cdk`

```bash
npm install -g aws-cdk
```

### Commands

- `cdk bootstrap` - deploying the AWS CDK for the first time
- `cdk synth` - constucts CloudFormation template and does some verification checks
- `cdk deploy --all` - deploy all CDK components
- `cdk destroy --all` - destroys all CDK components
  - issue with calling because of Fargate Cluster dependency - `FargateCluster/FargateCluster (...) Resource handler returned message: "The specified capacity provider is in use and cannot be removed.`
  - if called **twice** then all elements will be deleted

## References

https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-application-load-balancer.html
> If your service's task definition uses the awsvpc network mode (which is required for the Fargate launch type), you must choose IP addresses as the target type. This is because tasks that use the awsvpc network mode are associated with an elastic network interface, not an Amazon EC2 instance.

https://stackoverflow.com/questions/42715647/whats-the-target-group-port-for-when-using-application-load-balancer-ec2-con
> Protocol port will be overriden by ECS anwyays so doesn't matter.

https://www.cloudkeeper.com/insight/blog/amazon-ecs-service-communication-via-service-discovery-connect
> Choose client and server service if the container exposes and listens on a port for network traffic. This service gets an endpoint to communicate with any service within the same namespace

[CDK Workshop](https://cdkworkshop.com/)
> Instructions on using the AWS Cloud Development Kit (CDK)

[contributors-shield]: https://img.shields.io/github/contributors/programmingwithalex/aws_ecs_service_connect?style=for-the-badge
[contributors-url]: https://github.com/programmingwithalex/aws_ecs_service_connect/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/programmingwithalex/aws_ecs_service_connect?style=for-the-badge
[forks-url]: https://github.com/programmingwithalex/aws_ecs_service_connect/network/members
[stars-shield]: https://img.shields.io/github/stars/programmingwithalex/aws_ecs_service_connect?style=for-the-badge
[stars-url]: https://github.com/programmingwithalex/aws_ecs_service_connect/stargazers
[issues-shield]: https://img.shields.io/github/issues/programmingwithalex/aws_ecs_service_connect?style=for-the-badge
[issues-url]: https://github.com/programmingwithalex/aws_ecs_service_connect/issues
[license-shield]: https://img.shields.io/github/license/programmingwithalex/aws_ecs_service_connect.svg?style=for-the-badge
[license-url]: https://github.com/programmingwithalex/aws_ecs_service_connect/blob/main/LICENSE
