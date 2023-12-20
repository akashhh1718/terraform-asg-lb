resource "aws_launch_template" "foo" {
  name = "home_template"

  image_id      = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = "virginia_key"

  network_interfaces {
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "project"
    }
  } 
 
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    sudo -i
    sudo apt-get update
    sudo apt-get install -y apache2
    INSTANCE_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)
    echo "<html><body><h1>Hello $INSTANCE_HOSTNAME Welcome to the homepage...!!!</h1></body></html>" | sudo tee /var/www/html/index.html
    sudo service apache2 restart
    EOF
  )
}

################################################################################################################################################################

resource "aws_launch_template" "moo" {
  name = "mobile_template"

  image_id      = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = "virginia_key"

  network_interfaces {
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "project"
    }
  }
 
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    sudo -i
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    mkdir /var/www/html/mobile/
    INSTANCE_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)
    echo "<html><body><h1>Hello $INSTANCE_HOSTNAME Welcome to the mobile_page ...!!!</h1></body></html>" | sudo tee /var/www/html/mobile/index.html
    sudo service apache2 restart
    EOF
  )
}

##############################################################################################################################################################

resource "aws_launch_template" "loo" {
  name = "laptop_template"

  image_id      = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"
  key_name      = "virginia_key"

  network_interfaces {
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "project"
    }
  }
 
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    sudo -i
    sudo apt-get update
    sudo apt-get install -y apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    sudo mkdir /var/www/html/laptop/
    INSTANCE_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)
    echo "<html><body><h1>Hello $INSTANCE_HOSTNAME Welcome to the laptop_page ...!!!</h1></body></html>" | sudo tee /var/www/html/laptop/index.html
    sudo service apache2 restart
    EOF
  )
}