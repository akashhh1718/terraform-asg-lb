########### APPLICATION LB #########
resource "aws_lb" "foo" {
  name               = "project-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-06256b6f494633715", "subnet-07a97bb8be4366d5a"]

    tags = {
    Environment = "production"
  }
}

