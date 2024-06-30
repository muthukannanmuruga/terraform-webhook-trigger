data "external" "fetch_tags" {
  program = ["python", "${path.module}/fetch_tags.py", var.app_id]

  # Only run if app_id is provided
  depends_on = [var.app_id]
}
