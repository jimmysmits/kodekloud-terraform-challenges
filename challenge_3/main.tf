resource "aws_key_pair" "citadel-key" {
  key_name   = var.key_name
  public_key = file("/root/terraform-challenges/project-citadel/.ssh/ec2-connect-key.pub")
}

resource "aws_eip" "eip" {
  vpc = true
  instance = aws_instance.citadel.id
  provisioner "local-exec" {
    command = "echo ${self.public_dns} >> /root/citadel_public_dns.txt"
  }
}

resource "aws_instance" "citadel" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file("/root/terraform-challenges/project-citadel/install-nginx.sh")
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.citadel.id
  allocation_id = aws_eip.eip.id
}