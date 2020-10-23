provider "aws" {
  region = "us-west-1"
}

resource "aws_key_pair" "stormfirefox1" {
  key_name   = "stormfirefox1-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCj25h71sryk/5epo3yObh8HspR6ODMyaF/TSSC1SpIB2f9mPUKeCA8k32mrNpRCtVVwAhCn9OoVLfbfs4KzPNrxVByexqH6FORXY75mRUVdqF2qv9WDk7lANiTXV12+b9sMhtbGsU7r+CXGMCN+QZvnvLFb9xadKxNhJIyy+yQFu931uKl+GcGgePs4yj8uRLQ+o1yNU1WxzZgGHbBRAv/B98RCWoJTd+8RHfT/OxQL0PKx/LdHae/ium99xEJQ5DrbtMI+9BEM4vKN0FMCuVjPQ8sC8tIxzyqWZYyCIkiZmoH7TKGvD1Yg9jI9RxcuXB5793seiORAw9pH/U5w/8JKie5eGWXgrJkHMqqrvNGrw6TEk2gfaBllm8QSfS8O97xs6/BC1ENXUZ9R4rEGKpW9+pzHx/FTyD6FMMRstRcPjPCtU6F15g6XYAAjpbvxn4RiLT1Rk3mbJtM2xTAIUjYSfukGKzAs5gRp3TSNgdN+nsmcbJRMsA8FXubogDtYUO3VbpjsALA/bBHtjKziBVhbnoQ6PrXFrFaojeSq4Sf8iOOXK29Xfv/TSc+potmfw4wQMwSXJgOBFFhv9Xa/LwGf+1KpHpsfHO4xJ2yLpTUoiryvsbDsNk0+JbkMUgfNrJ+W01Lwf4qMKXbBOtNFf8gkTnj2Af3N6OCFa8XdgRO+Q== STORM_GPG_2FB5275E"
}

resource "aws_security_group" "allow_https_ssh" {
  name        = "allow_https_ssh"
  description = "Allow HTTPS/SSH traffic"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Ubuntu 20.04 LTS instance, for good measure
# Find other AMI's at https://cloud-images.ubuntu.com/locator/ec2/
resource "aws_instance" "breadbot" {
  ami             = "ami-021809d9177640a20"
  instance_type   = "t3a.nano"
  key_name        = aws_key_pair.stormfirefox1.key_name
  security_groups = [aws_security_group.allow_https_ssh.name]
  tags = {
    Name = "BreadBot"
  }
}

resource "aws_instance" "pass" {
  ami             = "ami-021809d9177640a20"
  instance_type   = "t3a.nano"
  key_name        = aws_key_pair.stormfirefox1.key_name
  security_groups = [aws_security_group.allow_https_ssh.name]
  tags = {
    Name = "Password Manager"
  }
}

# RETIRED TEMPORARILY
# resource "aws_instance" "minecraft" {
#   ami           = "ami-021809d9177640a20"
#   instance_type = "t3a.medium"
#   key_name        = aws_key_pair.stormfirefox1.key_name
#   security_groups = [aws_security_group.allow_https_ssh.name]
#   tags {
#     Name = "Minecraft Server"
#   }
# }

# ON STANBY ON HEROKU, WIP
# resource "aws_instance" "membership-portal" {
#   ami           = "ami-0a63cd87767e10ed4"
#   instance_type = "t3a.micro"
#   tags {
#     Name = "Membership Portal API"
#   }
# }
#
# resource "aws_db_instance" "membership-portal-db" {
#   allocated_storage = 10
#   engine            = "postgres"
#   instance_class    = "db.t3.micro"
#   name              = var.dbName
#   username          = var.dbUser
#   password          = var.dbPass
# }

resource "aws_s3_bucket" "acmucsd" {
  bucket = "acmucsd"
  acl    = "private"
}

resource "aws_s3_bucket" "acmucsd-membership-portal" {
  bucket = "acmucsd-membership-portal"
  acl    = "private"
}
