variable "aws_region" {
  
  default     = "us-east-1"
}

variable "vpc_name" {
 
  default     = "terraform-demo-vpc"
}

variable "internet_gw_name" {
 
  default     = "INTERNET_GATEWAY"
}

variable "nat_gw_name" {
 
  default     = "NAT"
}

variable "subnet_name1" {
 
  default     = "PUBLIC_SUBNET"
}

variable "subnet_name2" {
 
  default     = "PRIVATE_SUBNET_1"
}

variable "subnet_name3" {
 
  default     = "PRIVATE_SUBNET_2"
}

variable "subnet_name4" {
 
  default     = "PRIVATE_SUBNET_3"
}

variable "subnet_name5" {
 
  default     = "PRIVATE_SUBNET_4"
}

variable "subnet_name6" {
 
  default     = "PRIVATE_SUBNET_5"
}

variable "route_name1" {
 
  default     = "PUBLIC_ROUTE_TABLE"
}

variable "route_name2" {
 
  default     = "PRIVATE_ROUTE_TABLE1"
}

variable "route_name3" {
 
  default     = "PRIVATE_ROUTE_TABLE2"
}

variable "route_name4" {
 
  default     = "PRIVATE_ROUTE_TABLE3"
}

variable "route_name5" {
 
  default     = "PRIVATE_ROUTE_TABLE4"
}


variable "route_name6" {
 
  default     = "PRIVATE_ROUTE_TABLE5"
}



variable "sg_name" {
 
  default     = "terraform_ec2_private_sg"
}


variable "ec2_name1" {
 
  default     = "Public_subnet_EC2"
}

variable "ec2_name2" {
 
  default     = "Private_subnet_EC2"
}
