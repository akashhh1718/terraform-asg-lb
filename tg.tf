###########    Target Group for home  ###########

resource "aws_lb_target_group" "foo" {
  name     = "Home-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id = "vpc-0cd64d47bf9cd65e3"
}


###########    Target Group for mobile  ###########

resource "aws_lb_target_group" "moo" {
  name     = "Mobile-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0cd64d47bf9cd65e3"
}



###########    Target Group for laptop  ###########

resource "aws_lb_target_group" "loo" {
  name     = "Laptop-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0cd64d47bf9cd65e3"
}

