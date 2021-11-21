resource "aws_key_pair" "alfalinux" {
  key_name = "alfalinux"
  private_key = "b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtz
c2gtZWQyNTUxOQAAACCP8JjT4hIBLb5mv/R3WbYsUnPdqXfK/DhEsblxSEVI9AAA
AIiqKCoDqigqAwAAAAtzc2gtZWQyNTUxOQAAACCP8JjT4hIBLb5mv/R3WbYsUnPd
qXfK/DhEsblxSEVI9AAAAEAwUQIBATAFBgMrZXAEIgQgRQPYoqJzwCNCyP+456qg
sY/wmNPiEgEtvma/9HdZtixSc92pd8r8OESxuXFIRUj0AAAAAAECAwQF"
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
