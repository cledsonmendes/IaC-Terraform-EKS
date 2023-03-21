resource "aws_security_group" "ssh_cluster" {
  name   = "ssh_cluster"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_cluster.id
}

resource "aws_security_group_rule" "saida_ssh" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh_cluster.id
}

resource "aws_security_group" "privado" {
  name   = "privado-ECS"
  vpc_id = module.vpc.vpc_id
}

resource "aws_security_group_rule" "entrada_ECS" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.ssh_cluster.id
  security_group_id        = aws_security_group.privado.id
}

resource "aws_security_group_rule" "saida_ECS" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.privado.id
}
