# Module Outputs

output "iam_role_arn" {
  description = "The ARN of the IAM role created"
  value       = aws_iam_role.this.arn
}

output "iam_role_name" {
  description = "The name of the IAM role created"
  value       = aws_iam_role.this.name
}

output "instance_profile_arn" {
  description = "The ARN of the instance profile created"
  value       = var.create_profile ? aws_iam_instance_profile.this[0].arn : null
  # value = aws_iam_instance_profile.this.arn
  # value = join("", aws_iam_instance_profile.this.*.arn)
}

output "instance_profile_name" {
  description = "The name of the instance profile created"
  value       = var.create_profile ? aws_iam_instance_profile.this[0].name : null
  # value = aws_iam_instance_profile.this.name
  # value = join("", aws_iam_instance_profile.this.*.name)
}
