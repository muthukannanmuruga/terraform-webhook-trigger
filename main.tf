# Extract success status and tags from the external data source
locals {
  fetched_tags = var.app_id != "" ? data.external.fetch_tags.result : {success = "false", tags = "{}"}
  tags = local.fetched_tags.success == "true" ? jsondecode(local.fetched_tags.tags) : {}
}

resource "aws_instance" "my_instance" {
  count = local.fetched_tags.success == "true" ? 1 : 0

  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = merge({
    Name = "AmazonLinuxEC2Instance2"
  }, local.tags)
}