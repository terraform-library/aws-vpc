# AWS VPC

**Terraform module that defines a VPC with Internet Gateway.**


## Usage

* Quick start example:

```hcl
module "vpc" {
  source    = "git::https://github.com/terraform-library/aws-vpc.git?ref=master"
  name      = "${var.name}"
  namespace = "${var.namespace}"
  stage     = "${var.stage}"
}
```



## Inputs

| Name                               |    Default    | Description                                                                      | Required |
|:-----------------------------------|:-------------:|:---------------------------------------------------------------------------------|:--------:|
| `assign_generated_ipv6_cidr_block` |    `false`    | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC |    No    |
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
                                         
