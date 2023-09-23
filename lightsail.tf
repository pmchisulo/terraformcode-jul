resource "aws_lightsail_instance" "lightsail-example" {
  name              = "lightsail-example"
  instance_plan_key = "nano_2_0"
  
user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform</h1>" | sudo tee /var/www/html/index.html
              EOF  



output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}