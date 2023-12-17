resource "aws_vpc" "newsletter-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "newsletter-vpc"
    }
  
}

resource "aws_subnet" "newsletter-aws_subnet" {
    vpc_id = aws_vpc.newsletter-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true
    tags = {
      Name = "newsletter-sbn"
    }
  
}

resource "aws_internet_gateway" "newsletter-igw" {
  vpc_id              = aws_vpc.newsletter-vpc.id
      tags = {
        Name = "newsletter-igw"
      }

}


resource "aws_route_table" "newsletter-rt" {
  vpc_id = aws_vpc.newsletter-vpc.id

  tags = {
    Name = "newsletter-rt"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.newsletter-igw.id
  }
}

resource "aws_route_table_association" "primus-table" {
  subnet_id      = aws_subnet.newsletter-aws_subnet.id
  route_table_id = aws_route_table.newsletter-rt.id
}
