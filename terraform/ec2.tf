resource "aws_instance" "cloudrescue" {
  ami           = "ami-035827357e3c7e810"
  instance_type = "t3.micro"

  subnet_id = "subnet-01d38b6831d801828"

  key_name = "CloudRescue-Key"

  vpc_security_group_ids = [
    "sg-09d255d87c88b60f0"
  ]

  tags = {
    Name        = "CloudRescue-EC2"
    Project     = "CloudRescue"
    Environment = "Dev"
    Owner       = "Sameer"
    ManagedBy   = "Terraform"
  }
}