resource "aws_alb" "application" {
  load_balancer_type               = "application"
  name                             = var.load_balancer_name
  internal                         = var.load_balancer_is_internal
  security_groups                  = var.security_groups
  subnets                          = var.subnets
  idle_timeout                     = var.idle_timeout
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type
  tags = merge(
  var.tags,
  {
    "Name" = var.load_balancer_name
  },
  )

  access_logs {
    enabled = true
    bucket  = var.log_bucket_name
    prefix  = var.log_location_prefix
  }

  timeouts {
    create = var.load_balancer_create_timeout
    delete = var.load_balancer_delete_timeout
    update = var.load_balancer_update_timeout
  }

  count = var.create_alb && var.logging_enabled ? 1 : 0
}


resource "aws_lb" "alb" {
  name = "${var.lb_name}"
  load_balancer_type = "application"
  internal = true
  subnets = "${var.subnets}"
  security_groups = [var.security_groups]
  tags = merge(
  {
    "Name" = format("%s", var.name)
  },
  var.tags,
  var.alb_tags,
  )
}

resource "aws_alb" "ecs_cluster_alb" {
  name            = "${var.ecs_cluster_name}-ALB"
  internal        = false
  security_groups = ["${aws_security_group.ecs_alb_security_group.id}"]
  subnets         = ["${split(",", join(",", data.terraform_remote_state.infrastructure.public_subnets))}"]

  tags {
    Name = "${var.ecs_cluster_name}-ALB"
  }
}
