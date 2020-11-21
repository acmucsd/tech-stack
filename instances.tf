provider "aws" {
  region = "us-west-1"
}

resource "aws_key_pair" "stormfirefox1" {
  key_name   = "stormfirefox1-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCg6yTXpl91W0s05a7KsiIWOFrDtgw2wg/QH85vunAlxZ9eLmO4Uc4G+PIzrDcc9YUkda3EDOLCheXjJWQCqnrz7JW8IT7I8TI0p4CKRej28K9uzfiqdFpF0//0jfaSreKAcXj/PfUmHmgYlmGCVL0dsgWUnoZsG9hkhBR7IwK03BLJdhNGx18diJa4gek2i8Ppzhxs9Epy3ZUlm0PNuuAOE9GY0lmMRh3bHWpgvrIYADz1IUp2DECn9ERoFhNfYuNUt9r9wsdavriABdaUFIz39ncqXOpzoV/cf0SaRrgoodJUPKo5dYdWQsZjQUEfaWXaWh1aSm1XdUwQYZfqNQHgitTYjEM73WGpSBtQM67HOMjOT72sZwkF5S+/OLDqH+MVFbKBj6ePUtlELkOgDdkss/0rPwdH30f66r3dtrI2vla6d3+oqbXFnIMR6G9ITV5Zyaije8NsaU5QVxjhKr+w+/UgliPZNH6XIYlG4gb1NiAPaGOAHs8JNuPemoBdcQ95B6t2zjLNG2HPYUhVjkpCrOal/5vAtNigZ7k/zw62e7eCeGTEMTgmIHosh1WrUxqfMsagdEjfqYhI1pXAIDCsGTrH6x0hkvtQdvdVtMRNpVaSthR1lOVGRJevDvMxXaQ9NtJMtWSLWSjd1+FNJf3rRFCiAHUIkTC5khoKDJx3RQ== STORM_GPG_2FB5275E"
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


resource "aws_instance" "acmurl" {
  ami             = "ami-021809d9177640a20"
  instance_type   = "t3a.nano"
  key_name        = aws_key_pair.stormfirefox1.key_name
  security_groups = [aws_security_group.allow_https_ssh.name]
  tags = {
    Name = "ACMURL"
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

resource "aws_instance" "ai-api-testing" {
  ami             = "ami-021809d9177640a20"
  instance_type   = "t3a.nano"
  key_name        = aws_key_pair.stormfirefox1.key_name
  security_groups = [aws_security_group.allow_https_ssh.name]
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "ACM AI API (Testing)"
  }
}

resource "aws_instance" "ai-api" {
  ami             = "ami-021809d9177640a20"
  instance_type   = "t3a.micro"
  key_name        = aws_key_pair.stormfirefox1.key_name
  security_groups = [aws_security_group.allow_https_ssh.name]
  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "ACM AI API"
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
