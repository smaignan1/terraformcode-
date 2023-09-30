
resource "aws_lightsail_instance" "example" {
  name              = "lightsail-example"
  availability_zone = "us-east-1a"  # Change this to your desired availability zone
  blueprint_id      = "centos_7_1901_01"

  bundle_id = "nano_2_0"  # You can choose a different Lightsail plan if needed

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y 
    sudo yum install unzip wget httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    sudo unzip main.zip
    sudo rm -rf /var/www/html/*
    sudo cp -r static-resume-main/* /var/www/html/
    EOF
}