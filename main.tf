# Creates an AWS IAM Role, inline Policy and optional Instance Profile for resources


# Resources #

resource "aws_iam_instance_profile" "this" {
  count       = var.create_profile == "true" ? 1 : 0
  name        = var.instance_profile_name != null ? var.instance_profile_name : var.iam_role_name != null ? var.iam_role_name : null
  name_prefix = var.instance_profile_name_prefix != null ? var.instance_profile_name_prefix : var.iam_role_name_prefix != null ? var.iam_role_name_prefix : null
  role        = aws_iam_role.this.name
}

resource "aws_iam_role" "this" {
  # renders an assume role policy with passed "service" variable
  assume_role_policy = templatefile("${path.module}/templates/iam-policy-assume-role.json.tpl", { service = var.service })
  description        = var.description
  name               = var.iam_role_name
  name_prefix        = var.iam_role_name_prefix
  path               = var.path
  tags               = merge({ Name : coalesce(var.iam_role_name, var.iam_role_name_prefix, "terraform-assigned") }, var.tags)
}

resource "aws_iam_role_policy" "this" {
  name        = var.iam_policy_name != null ? var.iam_policy_name : var.iam_role_name != null ? var.iam_role_name : null
  name_prefix = var.iam_policy_name_prefix != null ? var.iam_policy_name_prefix : var.iam_role_name_prefix != null ? var.iam_role_name_prefix : null
  policy      = var.policy
  role        = aws_iam_role.this.id
}
