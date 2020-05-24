# Module Variables


# AWS IAM Instance Profile (aws_iam_instance_profile)
variable "create_profile" {
  default     = false
  description = "(optional) whether or not to create an instance profile of the role (default: false)"
  type        = bool
}
variable "instance_profile_name" {
  default     = null
  description = "(optional) the name to give to the profile"
  type        = string
}
variable "instance_profile_name_prefix" {
  default     = null
  description = "(optional) the name prefix to give to the profile"
  type        = string
}


# AWS IAM Role (aws_iam_role)
variable "description" {
  default     = null
  description = "(optional) the description to give to the role"
  type        = string
}
variable "iam_role_name" {
  default     = null
  description = "(optional) the name to give to the role"
  type        = string
}
variable "iam_role_name_prefix" {
  default     = null
  description = "(optional) the name prefix to give to the role"
  type        = string
}
variable "path" {
  default     = "/"
  description = "(optional) the path to place the role (default: /)"
  type        = string
}
variable "service" {
  description = "(required) service that needs access to assume the role (e.g. ec2.amazonaws.com)"
  type        = string
}
variable "tags" {
  default     = {}
  description = "(optional) additional tags to tag the role with - merged with a Name tag from 'name'"
  type        = map(string)
}


# AWS IAM Role Policy (aws_iam_role_policy)
variable "iam_policy_name" {
  default     = null
  description = "(optional) the name to give to the policy"
  type        = string
}
variable "iam_policy_name_prefix" {
  default     = null
  description = "(optional) the name prefix to give to the policy"
  type        = string
}
variable "policy" {
  description = "(required) the policy statement (json) to give to the role"
  type        = string
}
