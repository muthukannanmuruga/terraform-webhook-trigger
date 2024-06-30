output "instance_id" {
  description = "The ID of the EC2 instance"
  value = length(aws_instance.my_instance) > 0 ? aws_instance.my_instance[0].id : null
}

output "tags" {
  description = "Resource Tags"
  value = length(aws_instance.my_instance) > 0 ? aws_instance.my_instance[0].tags : null
}