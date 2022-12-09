 resource "aws_instance" "sam" {
  ami               = var.ami_id
  availability_zone = var.region
  #availability_zone = "ap-south-1b"
  instance_type     = var.instance_type

  tags = {
    Name = "HelloSAm"
  }

# create before destroy
  lifecycle {
    create_before_destroy = true
  }

# prevent destroy
 lifecycle {
    prevent_destroy = true
  }

# ignore changes
   lifecycle {
    ignore_change = true
  }