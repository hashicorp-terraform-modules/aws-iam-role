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
| create_profile | (Optional) Whether or not to create an instance profile of the role | bool | false | no |
| instance_profile_name | (Optional, Forces new resource) The name of the instance profile. If omitted, Terraform will assign a random, unique name. Conflicts with *instance_profile_name_prefix*. | string | null | no |
| instance_profile_name_prefix| (Optional, Forces new resource) Creates a unique instance profile name beginning with the specified prefix. Conflicts with *instance_profile_name*. | string | null | no |

### AWS IAM Role (aws_iam_role)

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| description | (Optional) The description to give to the role | string | N/A | no |
| iam_role_name | (Optional, Forces new resource) The name of the role. If omitted, Terraform will assign a random, unique name. Conflicts with *iam_role_name_prefix*. | string | null | no |
| iam_role_name_prefix | (Optional, Forces new resource) Creates a unique role name beginning with the specified prefix. Conflicts with *iam_role_name*. | string | null | no |
| path | (Optional) The path to the role | string | / | no |
| service | Service that needs access to assume the role (e.g. ec2.amazonaws.com) | string | N/A | yes |
| tags | (Optional) A mapping of additional tags to assign to the IAM role. (A 'Name' tag is added based on *iam_role_name* or *iam_role_name_prefix* if given) | map(string) | Name | no |

### AWS IAM Role Policy (aws_iam_role_policy)

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| iam_policy_name | (Optional, Forces new resource) The name of the inline policy. If omitted, Terraform will assign a random, unique name. Conflicts with *iam_policy_name_prefix*. | string | null | no |
| iam_policy_name_prefix | (Optional, Forces new resource) Creates a unique inline policy name beginning with the specified prefix. Conflicts with *iam_policy_name*. | string | null | no |
| policy | (Required) The inline policy document. This is a JSON formatted string | string | N/A | yes |

## Outputs

| Name | Description |
|------|-------------|
| iam_role_arn | The ARN of the IAM role created |
| iam_role_name | The name of the IAM role created |
| instance_profile_arn | The ARN of the instance profile created |
| instance_profile_name | The name of the instance profile created |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Notes

* This module uses Terraform version > 0.12.x

## To Do

* Add ability to specify/attached managed IAM policies

## Additional Documentation

- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [AWS IAM Roles User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html)
