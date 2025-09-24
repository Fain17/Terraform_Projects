variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "domain_name" {
  description = "Domain name for CloudFront distribution and ACM certificate"
  type        = string
  default     = ""
}

variable "default_root_object" {
  description = "Default root object for CloudFront distribution"
  type        = string
  default     = "index.html"
}

variable "route53_zone_id" {
  description = "Route53 hosted zone ID for DNS validation (required if domain_name is provided)"
  type        = string
  default     = ""
}
