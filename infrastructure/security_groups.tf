resource "aws_security_group" "nat_security_group" {
  name        = "nat_security_group"
  description = "NAT Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-nat-security-group"
  }
}

resource "aws_security_group" "bosh_security_group" {
  name        = "bosh_security_group"
  description = "Bosh Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 25555
    to_port     = 25555
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 6868
    to_port     = 6868
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 8443
    to_port     = 8443
  }

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-bosh-security-group"
  }
}

resource "aws_security_group" "vms_security_group" {
  name        = "vms_security_group"
  description = "VMs Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["10.0.0.0/16"]
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
  }

  ingress {
    self      = true
    protocol  = "-1"
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-vms-security-group"
  }
}

resource "aws_security_group" "mysql_security_group" {
  name        = "mysql_security_group"
  description = "MySQL Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
  }
  
   ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 8081
    to_port     = 8081
  }


  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-mysql-security-group"
  }
}

resource "aws_security_group" "elb_security_group" {
  name        = "elb_security_group"
  description = "ELB Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 4443
    to_port     = 4443
  }

  ingress {
    self      = true
    protocol  = "-1"
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-elb-security-group"
  }
}

resource "aws_security_group" "ssh_elb_security_group" {
  name        = "ssh_elb_security_group"
  description = "ELB SSH Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 2222
    to_port     = 2222
  }

  ingress {
    self      = true
    protocol  = "-1"
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-ssh-elb-security-group"
  }
}

resource "aws_security_group" "tcp_elb_security_group" {
  name        = "tcp_elb_security_group"
  description = "ELB TCP Security Group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    protocol    = "tcp"
    from_port   = 1024
    to_port     = 1123
  }

  ingress {
    self      = true
    protocol  = "-1"
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.env_name}-tcp-elb-security-group"
  }
}
