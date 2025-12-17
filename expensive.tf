resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI ID
  instance_type = "t2.large"

  tags = {
    Name = "ExpensiveInstance"
  }
}