output "configuration_details" {
  description = "Details of the configuration created"
  value = {
    application_name = var.app_name
    environment      = var.environment
    version          = var.app_version
    files_created = [
      local_file.app_config.filename,
      local_file.docker_env.filename,
      local_file.terraform_readme.filename
    ]
  }
}