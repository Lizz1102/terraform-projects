# TODO: Destroy and confirm in AWS Console that resources are destroyed 
resource "aws_vpc" "dev_tf_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "dev_tf_public_subnet" {
  vpc_id                  = aws_vpc.dev_tf_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev-public-subnet"
  }
}

resource "aws_internet_gateway" "dev_internet_gw" {
  vpc_id = aws_vpc.dev_tf_vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev_public_rt" {
  vpc_id = aws_vpc.dev_tf_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.dev_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_internet_gw.id
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.dev_tf_public_subnet.id
  route_table_id = aws_route_table.dev_public_rt.id
}

resource "aws_security_group" "dev_sg" {
  name        = "dev-sg"
  description = "Dev vpc security group"
  vpc_id      = aws_vpc.dev_tf_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #TODO MUST NOT UPLOAD ON GITHUB
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "tf_dev_auth" {
  key_name   = "dev-key"
  public_key = file("~/.ssh/tf-dev-project-key.pub")
}

resource "aws_instance" "dev_node" {
  ami                    = data.aws_ami.server_ami.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.tf_dev_auth.key_name
  vpc_security_group_ids = [aws_security_group.dev_sg.id]
  subnet_id              = aws_subnet.dev_tf_public_subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }
  
  tags = {
    Name = "dev-node"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/tf-dev-project-key"
    })
    interpreter = var.host_os == "windows" ? ["Powershell", "-command"] : ["bash", "-c"] 
  }
}
