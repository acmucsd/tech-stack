provider "aws" {
  region = "us-west-1"
}

# Ubuntu 20.04 LTS instance, for good measure
# Find other AMI's at https://cloud-images.ubuntu.com/locator/ec2/
resource "aws_instance" "breadbot" {
  ami           = "ami-0cd230f950c3de5d8"
  instance_type = "t3a.nano"
  tags {
    Name = "BreadBot"
  }
}

resource "aws_instance" "pass" {
  ami           = "ami-0cd230f950c3de5d8"
  instance_type = "t3a.nano"
  tags {
    Name = "Password Manager"
  }
}

# ACM Live runs on Ubuntu 16.04 LTS
# We'll use a HVM instance of it, no extra stuff on top.
resource "aws_instance" "live" {
  ami           = "ami-0a63cd87767e10ed4"
  instance_type = "m5a.large"
  tags {
    Name = "ACM Live"
  }
}

resource "aws_instance" "membership-portal" {
  ami           = "ami-0a63cd87767e10ed4"
  instance_type = "t3a.small"
  tags {
    Name = "Membership Portal API"
  }
}

resource "aws_db_instance" "membership-portal-db" {
  allocated_storage = 10
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  name              = var.dbName
  username          = var.dbUser
  password          = var.dbPass
}
