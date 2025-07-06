module "iam_user" {
  source = "github.com/cisagov/ami-build-iam-user-tf-module"

  providers = {
    aws            = aws
    aws.images-ami = aws.images-ami
    aws.images-ssm = aws.images-ssm
  }

  ssm_parameters = [
    "/cyhy/dev/users",
    "/ssh/public_keys/*",
    "/third_party_bucket_name",
  ]
  user_name = "build-freeipa-server-packer"
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-certificates to the EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_certificates" {
  # The only supported CDM environment is production.
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.images-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_certificates[0].outputs.bucket_access_policy.arn
  role       = module.iam_user.ec2amicreate_role.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-crowdstrike to the EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_crowdstrike" {
  # The only supported CDM environment is production.
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.images-ami

  policy_arn = data.terraform_remote_state.ansible_role_crowdstrike[0].outputs.bucket_access_policy.arn
  role       = module.iam_user.ec2amicreate_role.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-nessus-agent to the EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_nessus" {
  # The only supported CDM environment is production.
  count = terraform.workspace == "production" ? 1 : 0

  provider = aws.images-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_nessus_agent[0].outputs.bucket_access_policy.arn
  role       = module.iam_user.ec2amicreate_role.name
}
