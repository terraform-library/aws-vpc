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

| Name                               |    Default    | Description                                                                      | Required |
|:-----------------------------------|:-------------:|:---------------------------------------------------------------------------------|:--------:|
| `igw_id`                           |  `false`      | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC |    No    |
| `cidr_block`                       | `10.0.0.0/16` | CIDR for the VPC                                                                 |    No    |
| `enable_classiclink`               |    `false`    | A boolean flag to enable/disable ClassicLink for the VPC                         |    No    |
| `enable_classiclink_dns_support`   |    `false`    | A boolean flag to enable/disable ClassicLink DNS Support for the VPC             |    No    |
| `enable_dns_hostnames`             |    `true`     | A boolean flag to enable/disable DNS hostnames in the VPC                        |    No    |
| `enable_dns_support`               |    `true`     | A boolean flag to enable/disable DNS support in the VPC                          |    No    |
| `instance_tenancy`                 |      ``       | A tenancy option for instances launched into the VPC                             |    No    |
| `name`                             |      ``       | Name  (e.g. `bastion` or `db`)                                                   |    Yes   |
| `environment`                      |      ``       | Environment (e.g. `prod`, `dev`, `staging`)                                      |    Yes   |
| `managedby`                        |      ``       | Managedby (e.g. `devops-team` or `terraform-library`)                            |    Yes   |

       
## 👬 Contribution

- Open pull request with improvements
- Reach out with any feedback [![Twitter URL](https://img.shields.io/twitter/url/https/twitter.com/anmol_nagpal.svg?style=social&label=Follow%20anmolnagpal)](https://twitter.com/anmol_nagpal)
                                         
