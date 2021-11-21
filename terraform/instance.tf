resource "aws_key_pair" "terraform-iac" {
  key_name = "terraform-iac"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDl6gBstadTdYPFbxmapP7TTWN3YowCp/jp+99V0rzyvo1eAUIunH0ZeSPBYX6ufp22IyioJS5GBdE7S8UEIFz8Nuner2pJQyHbOHdbYD/U4ItfqQ1GXND7UdOLigSWaxAspBxXR60VKSB5CJlrXVjYiky90H0xkFhqamwq6Jv9ECIlKJJMY7HcH3vEvjXbpSwBrTXWUG+YfQyvbyIqLZYFDSrxjM62YQ+TvuV01mwFY1oRm/Q9+9SFz0VeMJwBjsJPIaL/chORJWnmBNXppYHFU5IVlcskAoUFdHnLolTm4WfgTO2VwwbWYOf6qDw/oiETBWcjx9YpOVfdwJuer0Wt real777@gmail.com"
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
