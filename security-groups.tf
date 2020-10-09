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
      "172.16.0.0/12"
    ]
  }
}

resource "aws_security_group" "eks_ns_default" {
  name_prefix = "${var.project}-eks_ns_default"
  vpc_id      = module.vpc.vpc_id
  description = "Security Group for default namespace"

}

resource "aws_security_group" "eks_ns_app1" {
  name_prefix = "${var.project}-eks_ns_app1"
  vpc_id      = module.vpc.vpc_id
  description = "Security Group for app1 namespace"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    security_groups = [
        aws_security_group.eks_ns_app2.id
    ]
  }
}

resource "aws_security_group" "eks_ns_app2" {
  name_prefix = "${var.project}-eks_ns_app2"
  vpc_id      = module.vpc.vpc_id
  description = "Security Group for app2 namespace"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    security_groups = [
      aws_security_group.eks_ns_default.id
    ]
  }
}

resource "aws_security_group" "eks_pod_app2" {
  name_prefix = "${var.project}-eks_pod_app2"
  vpc_id      = module.vpc.vpc_id
  description = "Security Group for app2 pod"
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    security_groups = [
        aws_security_group.eks_ns_app2.id
    ]
  }
}

