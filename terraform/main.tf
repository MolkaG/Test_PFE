terraform {
  required_version = \">= 1.0\"
}

resource \"local_file\" \"app_config\" {
  filename = \"application-terraform.properties\"
  content = <<-EOT
    app.name=Test_PFE_Spring_Boot
    app.version=1.0.0
    terraform.deployed=true
    deployment.timestamp=\
    database.name=foyer
    spring.profiles.active=terraform
  EOT
}

resource \"local_file\" \"docker_env\" {
  filename = \".env.terraform\"
  content = <<-EOT
    SPRING_PROFILES_ACTIVE=terraform
    TERRAFORM_DEPLOYED=true
    APP_VERSION=1.0.0
    DEPLOYMENT_TIMESTAMP=\
  EOT
}

resource \"local_file\" \"terraform_readme\" {
  filename = \"INFRASTRUCTURE.md\"
  content = <<-EOT
    # Infrastructure as Code (IaC)
    This infrastructure is managed by Terraform.
    Deployment Time: \
  EOT
}

output \"created_files\" {
  value = {
    app_config    = local_file.app_config.filename
    docker_env    = local_file.docker_env.filename
    documentation = local_file.terraform_readme.filename
  }
}

output \"deployment_summary\" {
  value = \"Terraform deployment completed. Files created: \, \, \\"
}
