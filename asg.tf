#######  AUTOSCALING  #########################

resource "aws_autoscaling_group" "foo" {
  name                      = "home-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  target_group_arns    = [
    aws_lb_target_group.foo.arn 
  ]

  launch_template {
    id      = aws_launch_template.foo.id
    version = "$Latest"
  }
  
  vpc_zone_identifier       = ["subnet-06256b6f494633715", "subnet-07a97bb8be4366d5a"]
  
  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}



resource "aws_autoscaling_group" "moo" {
  name                      = "mobile-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  target_group_arns    = [
    aws_lb_target_group.moo.arn
  ]

  launch_template {
    id      = aws_launch_template.moo.id
    version = "$Latest"
  }
  
  vpc_zone_identifier       = ["subnet-06256b6f494633715", "subnet-07a97bb8be4366d5a"]
  
  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}



resource "aws_autoscaling_group" "loo" {
  name                      = "laptop-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  target_group_arns    = [
    aws_lb_target_group.loo.arn
  ]

  launch_template {
    id      = aws_launch_template.loo.id
    version = "$Latest"
  }
  
  vpc_zone_identifier       = ["subnet-06256b6f494633715", "subnet-07a97bb8be4366d5a"]
  health_check_type         = "EC2"
  health_check_grace_period = 300 
  tag {
    key                 = "lorem"
    value               = "ipsum"
    propagate_at_launch = false
  }
}
