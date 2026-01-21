data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#-------------------------------------------

resource "aws_instance" "ansible_controller" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = "chave-ssh"
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "Ansible-Controller"
    Role = "Controller"
  }
}

resource "aws_instance" "jenkins_master" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = "chave-ssh"
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "Jenkins-Master"
    Role = "Master"
  }
}

resource "aws_instance" "jenkins_agent" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  key_name                    = "chave-ssh"
  vpc_security_group_ids      = [aws_security_group.security_group.id]
  subnet_id                   = aws_subnet.subnet.id
  associate_public_ip_address = true

  tags = {
    Name = "Jenkins-Agent"
    Role = "Agent"
  }
}

