resource "aws_lb_listener_rule" "alb_listerner_rule" {
  listener_arn = aws_lb_listener.alb_listener.arn
  priority = 100
  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb_targetgroup.arn
  }
  condition {
    field = "path-pattern"
    values = ["*"]
  }
}