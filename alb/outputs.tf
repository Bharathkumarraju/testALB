locals {
  lb_suffix = "ap-southeast-1.elb.amazonaws.com"
}

output "aws_alb_name" {
  value = aws_lb.alb.id
}

output "aws_alb_dns_name_prefix" {
  #value = aws_lb.alb.dns_name
  value = "${element(split(".", aws_lb.alb.dns_name), 0)}.ap-southeast-1.elb.amazonaws.com"
}


output "aws_alb_dns_name" {
  description = "The DNS name of the load balancer."
  value = element(
  concat(
  aws_lb.alb.*.dns_name,
  ["."],
  ),
  0,
  )
}

output "aws_alb_lisner" {
  value = aws_lb_listener.alb_listener.id
}

output "aws_alb_targetgroup" {
  value = aws_lb_target_group.alb_targetgroup.id
}

output "aws_alb_targetgroup_arn" {
  value = aws_lb_target_group.alb_targetgroup.arn
}

output "aws_alb_listener_rule" {
  value = aws_lb_listener_rule.alb_listerner_rule.id
}