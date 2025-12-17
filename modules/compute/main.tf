# Compute module

resource "aws_instance" "app" {
  ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main[0].id

  tags = {
    Name = "holiday-shopping-app-instance"
  }
}
