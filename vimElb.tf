 resource "aws_elb" "bar" {
  name                      = "ramesh-terraform-elb"
  availability_zones        = ["ap-south-1"]

  listener {
    instance_port          = 80
    instance_protocol      = "http"
    lb_port                = 80
    lb_protocol            = "http"
  }
 
  health_check {
    healthy_threshold    = 2
    unhealthy_threshold  = 2
    timeout              = 5
    target               = "HTTP:80/"
    interval             = 30
  }

  instances                 = ["${aws_instance.one.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {   
    Name = "ramesh-tf-elb"
  }
}

