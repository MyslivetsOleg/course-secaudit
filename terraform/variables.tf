variable "opennebula_username" {
  description = "OpenNebula username"
  type        = string
}

variable "opennebula_password" {
  description = "OpenNebula password"
  type        = string
  sensitive   = true
}

variable "opennebula_endpoint" {
  description = "OpenNebula endpoint"
  type        = string
  sensitive   = true
}

variable "minio_endpoint" {
  description = "MinIO S3 endpoint"
  type        = string
  sensitive   = true
}

variable "minio_bucket" {
  description = "MinIO S3 Bucket name"
  type        = string
  sensitive   = true
}

variable "minio_port" {
  description = "MinIO S3 port"
  type        = string
  sensitive   = true
}
variable "minio_access_key" {
  type        = string
  description = "Access key for MinIO"
}

variable "minio_secret_key" {
  type        = string
  description = "Secret key for MinIO"
}