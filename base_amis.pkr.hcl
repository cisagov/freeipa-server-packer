data "amazon-ami" "fedora_43_arm64" {
  filters = {
    architecture        = "arm64"
    name                = "Fedora-Cloud-Base-AmazonEC2.aarch64-43-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["125523088429"]
  region      = var.build_region
}

data "amazon-ami" "fedora_43_x86_64" {
  filters = {
    architecture        = "x86_64"
    name                = "Fedora-Cloud-Base-AmazonEC2.x86_64-43-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
  }
  most_recent = true
  owners      = ["125523088429"]
  region      = var.build_region
}
