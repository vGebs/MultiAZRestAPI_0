resource "aws_launch_template" "restAPIServer" {
  name_prefix   = "restAPIServer"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = var.security_group_ids

  user_data = base64encode(templatefile("${path.module}/user_data.tpl", {}))

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "restAPIServer"
      Environment = var.environment
    }
  }
}

resource "aws_autoscaling_group" "restAPIServer" {
  name_prefix         = "restAPIServer_scalingGroup"
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.restAPIServer.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "restAPIServer_scalingGroup"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = var.environment
    propagate_at_launch = true
  }
}

