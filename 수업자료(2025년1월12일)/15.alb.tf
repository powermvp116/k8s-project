####### lb 생성

resource "aws_lb" "web-lb" {
    name = "web-lb"
    subnets = [ aws_subnet.terraform-pub-subnet-2a.id, aws_subnet.terraform-pub-subnet-2c.id ]
    internal = false
    security_groups = [ aws_security_group.terraform-sg-bastion.id ]
    load_balancer_type = "application"
    tags = {
      "Name" = "web-lb"
    }
}

############## Target Group

resource "aws_lb_target_group" "terraform-prd-tg" {
    name = "terraform-prd-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.terraform-vpc.id
    health_check {
      port = 80
      path ="/"
    }
    tags = {
      "Name" = "terraform-prd-tg"
    }
}

############Listener 

resource "aws_lb_listener" "terraform-prd-listener" {
    load_balancer_arn = aws_lb.web-lb.arn
    port = "80"
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.terraform-prd-tg.arn
      type = "forward"
    }
  
}

##### target group attachment
/*
resource "aws_lb_target_group_attachment" "terraform-prd-tg-attachment1" {
    target_group_arn = aws_lb_target_group.terraform-prd-tg.arn
    target_id = aws_instance.terraform-pub-ec2-bastion-2a.id
    port = 80
  
}
*/

