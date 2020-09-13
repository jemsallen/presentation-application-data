module "networking" {
    source = "./modules/network"
    environment          = var.environment
    vpc_cidr             = var.vpc_cidr
    public_subnets_cidr  = var.public_subnets_cidr
    private_subnets_cidr = var.private_subnets_cidr
    availability_zones   = ["us-east-1a","us-east-1b","us-east-1c"]
}

data "aws_ami" "ubuntu" {
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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = join(",",module.networking.public_subnet_id)

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = join(",",module.networking.private_subnet_id)

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_dynamodb_table" "example" {
  name             = "example"
  hash_key         = "TestTableHashKey"
  billing_mode     = "PAY_PER_REQUEST"
  stream_enabled   = true
  stream_view_type = "NEW_AND_OLD_IMAGES"

  attribute {
    name = "TestTableHashKey"
    type = "S"
  }

  replica {
    region_name = "us-east-2"
  }

}