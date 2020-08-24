
resource "aws_security_group" "worker_group_mgmt_one" {
  name_prefix = "${var.project}-worker_group_mgmt_one"
  vpc_id      = module.vpc.vpc_id
  description = "Management for EKS worker group one"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
    ]
  }
}

resource "aws_security_group" "worker_group_mgmt_two" {
  name_prefix = "${var.project}-worker_group_mgmt_two"
  vpc_id      = module.vpc.vpc_id
  description = "Management for EKS worker group two"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "192.168.0.0/16",
    ]
  }
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "${var.project}-all_worker_management"
  vpc_id      = module.vpc.vpc_id
  description = "Management for EKS worker nodes"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
    ]
  }
}
