## Internal Security Group
resource "aws_security_group" "ms_sql" {
  name        = "${var.customer}-${var.envname}-ms-sql-pull"
  vpc_id      = "${var.vpc_id}"
  description = "ms sql security group"

  egress {
    from_port   = "1433"
    to_port     = "1433"
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnets_cidrs}"]
    }

  ingress {
    from_port   = "1433"
    to_port     = "1433"
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnets_cidrs}"]
    }
}

resource "aws_security_group_rule" "rdp" {
  type                      = "ingress"
  protocol                  = "tcp"
  from_port                 = "3389"
  to_port                   = "3389"
  security_group_id         = "${aws_security_group.ms_sql.id}"
  source_security_group_id  = "${var.rdgw_internal_sg_id}"
}
