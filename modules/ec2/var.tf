variable "ami" {
    description = "ami id of ec2"
    type = string
}
variable "instance_type" {
    description = "type of ec2"
    type = string
}
variable "subnet_id" {
  description = "The Subnet ID where EC2 instance will be launched"
  type        = string
}
variable "vpc_id"{}