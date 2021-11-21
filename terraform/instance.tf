resource "aws_key_pair" "terraform-keys2" {
  key_name = "terraform-keys2"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2BBR94+NRFH6kfWQ48ZycBBS4DEJb3EFzsfmnmPbaq23l2bmYoBhXugHIzQYmfLGzMZd2TQeZNYSIonFOUZcQzq+Q8BS0SH3cEbJbDhUVAN+rJ3KwlFDn/p8pWbQgwd4mbS5/yGWt0wwMY7NhBYy7v00dEq6FBrVYnhMu8T8MrYrZrtSDkl9CF7+2ULd+1hc3mbE2A5P6EDgMMGE9WkLsSRf0ibEXoypH2/8f7MPtoC0dAEVezNunKmkO4pvuakLC6EIg3EqaHEUnFnEMvuJPGaO4afZJ8YQW4iCpcPpxGr7VNhK/H6sJtHJVr2KyNACO0iRk1DT+6l6ml6cJquKf root@dnetapapp01.alfa.bank.int"
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
