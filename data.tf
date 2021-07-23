data "aws_availability_zones" "all" {}

output "AZ" {
  value = data.aws_availability_zones.all.names
}




data "aws_ami" "image" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

output "AMI_ID" {
  value = data.aws_ami.image.id
}