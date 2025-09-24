variable "bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}

variable "bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "domain_name" {
  description = "Domain name for CloudFront distribution"
  type        = string
  default     = ""
}

variable "default_root_object" {
  description = "Default root object for CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for custom domain"
  type        = string
  default     = ""
}
