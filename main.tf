provider "aws" {
    profile = "default"
    region = var.aws_region
}

## Create VPC ##
resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "172.16.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}




/*==== Subnets ======*/
/* Internet gateway for the public subnet */
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.internet_gw_name
  }
}
/* Elastic IP for NAT */
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.ig]
}
/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.public_subnet.id}"
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = var.nat_gw_name
 
  }
}
/* Public subnet */
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name        = var.subnet_name1
  }
}


/* Private subnet */
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name        = var.subnet_name2
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false
  tags = {
    Name        = var.subnet_name3
  }
}

resource "aws_subnet" "private_subnet3" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.4.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = false
  tags = {
    Name        = var.subnet_name4
  }
}

resource "aws_subnet" "private_subnet4" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.5.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = false
  tags = {
    Name        = var.subnet_name5
  }
}

resource "aws_subnet" "private_subnet5" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.6.0/24"
  availability_zone       = "us-east-1f"
  map_public_ip_on_launch = false
  tags = {
    Name        = var.subnet_name6
  }
}


/* Routing table for private subnet */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.route_name1
  }
}

/* Routing table for public subnet */
resource "aws_route_table" "private1" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.route_name2
  }
}

resource "aws_route_table" "private2" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.route_name3
  }
}

resource "aws_route_table" "private3" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.route_name4
  }
}

resource "aws_route_table" "private4" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.route_name5
  }
}

resource "aws_route_table" "private5" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = var.route_name6
  }
}
resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

resource "aws_route" "private_nat_gateway1" {
  route_table_id         = "${aws_route_table.private1.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

resource "aws_route" "private_nat_gateway2" {
  route_table_id         = "${aws_route_table.private2.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

resource "aws_route" "private_nat_gateway3" {
  route_table_id         = "${aws_route_table.private3.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

resource "aws_route" "private_nat_gateway4" {
  route_table_id         = "${aws_route_table.private4.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

resource "aws_route" "private_nat_gateway5" {
  route_table_id         = "${aws_route_table.private5.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}
/* Route table associations */
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = "${aws_subnet.private_subnet1.id}"
  route_table_id = "${aws_route_table.private1.id}"
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = "${aws_subnet.private_subnet2.id}"
  route_table_id = "${aws_route_table.private2.id}"
}

resource "aws_route_table_association" "private_3" {
  subnet_id      = "${aws_subnet.private_subnet3.id}"
  route_table_id = "${aws_route_table.private3.id}"
}

resource "aws_route_table_association" "private_4" {
  subnet_id      = "${aws_subnet.private_subnet4.id}"
  route_table_id = "${aws_route_table.private4.id}"
}

resource "aws_route_table_association" "private_5" {
  subnet_id      = "${aws_subnet.private_subnet5.id}"
  route_table_id = "${aws_route_table.private5.id}"
}



## Security Group##
resource "aws_security_group" "terraform_private_sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  name        = var.sg_name

  ingress {
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform-vpc.cidr_block]
    from_port   = 22
    to_port     = 22
  }

ingress {
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform-vpc.cidr_block]
    from_port   = 80
    to_port     = 80
  }

 ingress {
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.terraform-vpc.cidr_block]
    from_port   = 443
    to_port     = 443
  }


  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "ec2-private-sg"
  }
}





resource "aws_instance" "public_ec2" {
    ami = "ami-033b95fb8079dc481"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.public_subnet.id}"
    key_name               = "ec2"
    associate_public_ip_address = true
    tags = {
      Name              = var.ec2_name1
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}




resource "aws_instance" "private_ec2" {
    ami = "ami-033b95fb8079dc481"
    instance_type = "t2.micro"
  vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.private_subnet1.id}"
    key_name               = "ec2"
    associate_public_ip_address = true
    tags = {
      Name              = var.ec2_name2
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}



