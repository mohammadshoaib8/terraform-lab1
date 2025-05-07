resource "aws_vpc" "myvpc" {
    cidr_block = var.cidr_block
    tags = {
        Name = "testvpc"
    }
}

resource "aws_subnet" "pubsub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.100.0.0/24"
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    tags = {
        Name = var.name
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}
resource "aws_route_table_association" "rtassociat" {
    subnet_id = aws_subnet.pubsub.id
    route_table_id = aws_route_table.rt.id
}