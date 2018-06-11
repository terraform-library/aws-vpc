# AWS VPC

**Terraform module that defines a VPC with Internet Gateway.**


## Usage

* Quick start example:

```hcl
module "vpc" {
  source                            = "git::https://github.com/terraform-library/aws-vpc.git?ref=master"
  name                              = "dev-vpc""
  cidr                              = "10.0.0.0/16"                           
  
  availabilities_zones              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets                   = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets                    = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags                              = {
  
                                       environment = "dev"
  }
}
```



## Inputs

| Name                               |    Default    | Description                                                                      | Required |
|:-----------------------------------|:-------------:|:---------------------------------------------------------------------------------|:--------:|
| `cidr_block`                       | `10.0.0.0/16` | CIDR for the VPC                                                                 |    No    |
| `enable_classiclink`               |    `false`    | A boolean flag to enable/disable ClassicLink for the VPC                         |    No    |
| `enable_classiclink_dns_support`   |    `false`    | A boolean flag to enable/disable ClassicLink DNS Support for the VPC             |    No    |
| `enable_dns_hostnames`             |    `true`     | A boolean flag to enable/disable DNS hostnames in the VPC                        |    No    |
| `enable_dns_support`               |    `true`     | A boolean flag to enable/disable DNS support in the VPC                          |    No    |
| `instance_tenancy`                 |      ``       | A tenancy option for instances launched into the VPC                             |    No    |
| `name`                             |      ``       | Name  (e.g. `bastion` or `db`)                                                   |    Yes   |
| `environment`                      |      ``       | Environment (e.g. `prod`, `dev`, `staging`)                                      |    Yes   |
| `managedby`                        |      ``       | Managedby (e.g. `devops-team` or `terraform-library`)                            |    Yes   |


## Output

| Name                               | Description
|:-----------------------------------|:--------------------------------------------------------------|
| igw_id                             | The ID of the Internet Gateway                                |                                                        |
| vpc_id                             | The ID of the VPC                                             |                                  |
| vpc_cidr_block                     | The CIDR block of the VPC                                     |                                           |
| route_table_id                     | The ID of the route table created by default on VPC creation  |                                                                              |
| public_vpc_association_id          | The association ID for public IP CIDR block                   |                                                              |
| private_vpc_association_id         | The association ID for private IP CIDR block                  |                                                               |
| private_subnets                    | List of IDs of private subnets                                |                                                 |
| private_subnets_cidr_blocks        | List of cidr_blocks of private subnets                        |                                                      |
| public_subnets                     | List of IDs of public subnets                                 |                                                |
| private_subnets_cidr_blocks        | List of cidr_blocks of public subnets                         |                                                         |
 
## 👬 Contribution

- Open pull request with improvements
- Reach out with any feedback [![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/anmol_nagpal.svg?style=social&label=Follow%20anmolnagpal)](https://twitter.com/anmol_nagpal)
                                         
