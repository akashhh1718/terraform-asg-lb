############# Listner rule ######################




resource "aws_lb_listener" "foo" {
  load_balancer_arn = aws_lb.foo.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.foo.arn
    type             = "forward"
 
    }
  }


resource "aws_lb_listener_rule" "foo" {
  listener_arn = aws_lb_listener.foo.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.foo.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
}
}

resource "aws_lb_listener_rule" "moo" {
 listener_arn = aws_lb_listener.foo.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.moo.arn
  }

  condition {
    path_pattern {
      values = ["/mobile/"]
    }
  }
}

resource "aws_lb_listener_rule" "loo" {
 listener_arn = aws_lb_listener.foo.arn
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.loo.arn
  }

  condition {
    path_pattern {
      values = ["/laptop/"]
    }
  }
}