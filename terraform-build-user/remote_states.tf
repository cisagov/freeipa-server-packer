# ------------------------------------------------------------------------------
# Retrieves state data from Terraform backends. This allows use of the
# root-level outputs of one or more Terraform configurations as input data
# for this configuration.
# ------------------------------------------------------------------------------

data "terraform_remote_state" "images_parameterstore_production" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-images-parameterstore/terraform.tfstate"
  }

  workspace = "production"
}

data "terraform_remote_state" "images_parameterstore_staging" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-images-parameterstore/terraform.tfstate"
  }

  workspace = "staging"
}

data "terraform_remote_state" "images_production" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/images.tfstate"
  }

  workspace = "production"
}

data "terraform_remote_state" "images_staging" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/images.tfstate"
  }

  workspace = "staging"
}

data "terraform_remote_state" "ansible_role_cdm_certificates" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "ansible-role-cdm-certificates/terraform.tfstate"
  }
}

data "terraform_remote_state" "ansible_role_cdm_nessus_agent" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "ansible-role-cdm-nessus-agent/terraform.tfstate"
  }
}

data "terraform_remote_state" "ansible_role_cdm_tanium_client" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "ansible-role-cdm-tanium-client/terraform.tfstate"
  }
}

data "terraform_remote_state" "users" {
  backend = "s3"

  config = {
    encrypt        = true
    bucket         = "cisa-cool-terraform-state"
    dynamodb_table = "terraform-state-lock"
    profile        = "cool-terraform-backend"
    region         = "us-east-1"
    key            = "cool-accounts/users.tfstate"
  }

  workspace = "production"
}
