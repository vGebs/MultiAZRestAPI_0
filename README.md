# Multi AZ Rest API: Cloud

The main objective with this architecture is to:
1. Provide a modular system that runs a SINGLE microservice in multiple AZs with no Database.
    - The assumption is that the development team is using a serverless database service.
2. Provide an a quick starting point for further development.
    - Each architecture has its own specific business needs. This system aims to provide a template for further development.

## System Design
### 1-tier architecture
This system is a single-tier architecture with logically isolated subnets.

### Subnets
1. aws_subnet.loadBalancer_public
- This is the public access point to the VPC.
- It is a smaller subnet containing load balancers
- This subnet can accept internet traffic
- It can only send requests to the *aws_subnet.restAPI_private*

2. aws_subnet.restAPI_private
- This is the application server where the code is run
- Contains auto-scaling ec2's
- Can only receive requests from *aws_subnet.loadBalancer_public*
- Can only send requests to *aws_subnet.NAT*

3. aws_subnet.NAT
- This is the NAT Gateway
- It has its own logically isolated subnet with a default mask of "/29"
- Accepts traffic from *aws_subnet.restAPI_private*
- Can send requests through internet gateway

## Devlopment

This is system is currently under development.