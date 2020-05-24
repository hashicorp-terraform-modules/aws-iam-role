# Terraform Module: AWS Identity and Access Management (IAM) Role (aws-iam-role)

Terraform module to create an AWS Identity and Access Management (IAM) Role
with an inline policy (that you provide) and optionally creates an instance
profile for it as well

* [Resources](#Resources)
* [Usage](#Usage)
* [Inputs](#Inputs)
* [Outputs](#Outputs)
* [Notes](#Notes)
* [To Do](#To-Do)
* [Additional Documentation](#Additional-Documentation)

## Resources

These types of resources are supported:

* [AWS IAM Instance Profile](https://www.terraform.io/docs/providers/aws/r/iam_instance_profile.html)
* [AWS IAM Role](https://www.terraform.io/docs/providers/aws/r/iam_role.html)
* [AWS IAM Role Policy](https://www.terraform.io/docs/providers/aws/r/iam_role_policy.html)

## Usage

```hcl
module "s3_bucket_example" {
  source = "git@github.com:hashicorp-terraform-modules/aws-iam-role.git?ref=v0.0.0"

  create_profile        = "true"  # create instance profile from the role
  description           = "My role's description"
  policy                = file("${path.module}/templates/my-iam-policy.json")
  service               = "ec2.amazonaws.com"
  tags                  = "${local.tags}"
  iam_role_name         = "my-role"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

### AWS IAM Instance Profile (aws_iam_instance_profile)

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_profile | (Optional) Whether or not to create an instance profile of the role | bool | false | no |
| instance_profile_name | (Optional) Name to give the instance profile (defaults to the same as the role name) | string | null | no |

### AWS IAM Role (aws_iam_role)

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| iam\_role_name | (Optional, Forces new resource) The name of the role. If omitted, Terraform will assign a random, unique name. Conflicts with name\_prefix. | string | null | no |
| iam\_role\_name\_prefix | (Optional, Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name. | string | null | no |
| description | (Optional) The description to give to the role | string | N/A | no |
| path | (Optional) The path to the role | string | / | no |
| service | Service that needs access to assume the role (e.g. ec2.amazonaws.com) | string | N/A | yes |
| tags | (Optional) A mapping of additional tags to assign to the IAM role. (A 'Name' tag is added based on name or name\_prefix) | map(string) | Name | no |

### AWS IAM Role Policy (aws_iam_role_policy)

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| iam\_policy\_name | (Optional) A list of filtering objects that accepts a prefix, set of tags or both. Unique identifier of the metrics configuration to create for the bucket. | string | null | no |
| policy | (Required) The inline policy document. This is a JSON formatted string | string | N/A | yes |

## Outputs

| Name | Description |
|------|-------------|
| arn | The ARN of the bucket created |
| dns | The DNS domain name of the bucket created |
| name | The Name of the bucket created |
| region | The AWS region this bucket resides in |
| website\_endpoint | The website endpoint, if the bucket is configured with a website. If not, this will be an empty string |
| website\_domain | The domain of the website endpoint, if the bucket is configured with a website. If not, this will be an empty string. This is used to create Route 53 alias records |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Notes

* This module uses Terraform version > 0.12.x

## To Do

* Add ability to specify/attached managed IAM policies

## Additional Documentation

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS IAM Roles User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
