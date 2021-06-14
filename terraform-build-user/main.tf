module "iam_user" {
  source = "github.com/cisagov/ami-build-iam-user-tf-module"

  providers = {
    aws                       = aws
    aws.images-production-ami = aws.images-production-ami
    aws.images-staging-ami    = aws.images-staging-ami
    aws.images-production-ssm = aws.images-production-ssm
    aws.images-staging-ssm    = aws.images-staging-ssm
  }

  ssm_parameters = [
    "/cdm/tanium_hostname",
    "/cyhy/dev/users",
    "/ssh/public_keys/*",
  ]
  user_name = "build-freeipa-server-packer"
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-tanium-client to the production
# EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_tanium_production" {
  provider = aws.images-production-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_tanium_client.outputs.production_bucket_policy.arn
  role       = module.iam_user.ec2amicreate_role_production.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-tanium-client to the staging EC2AMICreate
# role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_tanium_staging" {
  provider = aws.images-staging-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_tanium_client.outputs.staging_bucket_policy.arn
  role       = module.iam_user.ec2amicreate_role_staging.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-nessus-agent to the production
# EC2AMICreate role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_nessus_production" {
  provider = aws.images-production-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_nessus_agent.outputs.production_bucket_policy.arn
  role       = module.iam_user.ec2amicreate_role_production.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-nessus-agent to the staging EC2AMICreate
# role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_nessus_staging" {
  provider = aws.images-staging-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_nessus_agent.outputs.staging_bucket_policy.arn
  role       = module.iam_user.ec2amicreate_role_staging.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-certificates to the production EC2AMICreate
# role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_certificates_production" {
  provider = aws.images-production-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_certificates.outputs.production_bucket_policy.arn
  role       = module.iam_user.ec2amicreate_role_production.name
}

# Attach 3rd party S3 bucket read-only policy from
# cisagov/ansible-role-cdm-certificates to the staging EC2AMICreate
# role
resource "aws_iam_role_policy_attachment" "thirdpartybucketread_certificates_staging" {
  provider = aws.images-staging-ami

  policy_arn = data.terraform_remote_state.ansible_role_cdm_certificates.outputs.staging_bucket_policy.arn
  role       = module.iam_user.ec2amicreate_role_staging.name
}
