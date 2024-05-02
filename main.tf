resource "aws_instance" "myinst" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = aws_key_pair.myawskey.key_name
    tags =  {
        "Name" = "master" 
    } 
    depends_on = [ aws_key_pair.myawskey ]
    security_groups = [ "launch-wizard-1" ] 
    connection {
      type = "ssh"
      user = "ubuntu"
      host = self.public_ip
      private_key = file("/home/akash/.ssh/id_rsa")
    }
    provisioner "file" {
        source = "/home/akash/.ssh/id_rsa"
        destination = "/home/ubuntu/.ssh/id_rsa"   
    }

    provisioner "remote-exec" {
      inline = [ "sudo hostnamectl set-hostname master ",
      "chmod 400 /home/ubuntu/.ssh/id_rsa"  ]
    }
    user_data = <<-EOF
                            #!/bin/bash
                            apt update
                            apt install software-properties-common
                            add-apt-repository --yes --update ppa:ansible/ansible
                            apt install ansible -y
                            EOF
}
resource "aws_instance" "myinst1" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = aws_key_pair.myawskey.key_name
    tags =  {
        "Name" = "worker1" 
    } 
    depends_on = [ aws_key_pair.myawskey ]
    security_groups = [ "launch-wizard-1" ] 
    user_data  = <<-EOF
                              #!/bin/bash
                              hostnamectl set-hostname worker1
                            EOF
}
resource "aws_instance" "myinst2" {
    ami = "ami-007020fd9c84e18c7"
    instance_type = "t2.micro"
    key_name = aws_key_pair.myawskey.key_name
    tags =  {
        "Name" = "worker2" 
    } 
    depends_on = [ aws_key_pair.myawskey ]
    security_groups = [ "launch-wizard-1" ] 
       user_data  = <<-EOF
                              #!/bin/bash
                              hostnamectl set-hostname worker2
                            EOF
}
resource "aws_key_pair" "myawskey" {
  public_key = file("/home/akash/.ssh/id_rsa.pub")
  key_name = "myterrakey"
}
