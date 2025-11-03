variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "Test_PFE"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "development"
}

variable "app_version" {
  description = "Application version"
  type        = string
  default     = "1.0.0"
}