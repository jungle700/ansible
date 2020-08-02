provider "aws" {

  region = var.aws_region

}

data "template_file" "myuserdata1" {

  template = file("${path.cwd}/ansi.tpl")

}



resource "aws_instance" "ansi" {

  instance_type = "t2.micro"

  ami = "ami-0c3e74fa87d2a4227"

  key_name = "tkay"

  user_data = data.template_file.myuserdata1.template

  
  tags = {

    Name = "Ansible_Server"

  }

}