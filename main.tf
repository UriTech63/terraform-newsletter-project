


resource "aws_instance" "newsletter-server" {
  ami                     = "ami-018ba43095ff50d08"
  instance_type           = "t2.micro"
  key_name                = "project-key"
  subnet_id               = aws_subnet.newsletter-aws_subnet.id
  vpc_security_group_ids  = [ aws_security_group.newsletter-sg.id ]


  tags = {
    Name = "Newsletter-instance"
  }
}



