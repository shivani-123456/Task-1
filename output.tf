output "aws_vpc_id" {
  value = "${aws_vpc.terraform-vpc.id}"
}

output "aws_public_instance_id" {
  value = "${aws_instance.public_ec2.id}"
}

output "aws_security_gr_id" {
  value = "${aws_security_group.terraform_private_sg.id}"
}

output "aws_private_instance_id" {
  value = "${aws_instance.private_ec2.id}"
}
