Using infrastructure-as-code tooling, create the following (our preference is Terraform):

1. Create a vpc with a cidr 10.0.0.0/16

2. Create 3 subnets within the VPC in different AZ's , demonstrate basic AWS security principles.

3. Elastic load balancer with port 80 and 443 exposed and a public ip address

4. Create a domain in route 53 (any will do, private won't need registration) and get a cert for the domain to apply to the ELB

5. An EC2 instance with nginx installed (automatically), in the private subnet, and only accessible via SSM

6. Mysql instance with configurable DB name, username and password accessible by the vpc only, in the private subnet

7. Output the ELB IP, mysql url, username and password at end of run

8. ec2 instance size and root block size aswell as mysql dbname, username, password, instance size and space configurable with a TF vars file or Cloudformation attributes.

9. If using Terraform state file, it can be saved to an s3 bucket