resource "aws_key_pair" "terraform-keys2" {
  key_name = "terraform-keys2"
  public_key = "terraform-keys2.pub"
}

resource "aws_instance" "linux-instance" {
  ami           = "ami-009b16df9fcaac611"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.lesson12-subnet-public-3.id

  vpc_security_group_ids = [aws_security_group.lesson12-all.id]
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      timeout     = "4m"
   }

  tags = {
    "Name" = "linux-instance"
  }

  depends_on = [
    aws_db_instance.lesson12-rds,
  ]
}
