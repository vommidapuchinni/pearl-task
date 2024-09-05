resource "aws_instance" "ecs_instance" {
  ami                    = "ami-0e86e20dae9224db8"  # Use an appropriate Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ecs.id]  # Updated security group parameter
  iam_instance_profile   = aws_iam_instance_profile.ecs_instance_profile.name
  tags = {
    Name = "ecs-instance"
  }
}

resource "aws_iam_instance_profile" "ecs_instance_profile" {
  name = "ecsInstanceProfile"
  role = aws_iam_role.ecs_instance_role.name
}

