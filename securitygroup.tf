resource "aws_security_group" "alb_sg" {
  description = "security group that allows specific ports and traffic to load balancer"
  vpc_id      = aws_vpc.main-vpc.id
  name        = "alb-aws-sg"

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "application_sg" {
  description = "security group that allows specific ports and traffic to application"
  vpc_id      = aws_vpc.main-vpc.id
  name        = "application-aws-sg"

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    security_groups = [aws_security_group.alb_sg.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}