output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = module.s3_bucket.bucket_name
}

output "s3_bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  value       = module.s3_bucket.bucket_domain_name
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = module.cloudfront.distribution_id
}

output "cloudfront_domain_name" {
  description = "Domain name of the CloudFront distribution"
  value       = module.cloudfront.domain_name
}

output "cloudfront_distribution_arn" {
  description = "ARN of the CloudFront distribution"
  value       = module.cloudfront.distribution_arn
}

output "acm_certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = module.acm_certificate.certificate_arn
}

output "acm_certificate_status" {
  description = "Status of the ACM certificate"
  value       = module.acm_certificate.certificate_status
}

output "dns_validation_cname_name" {
  description = "CNAME name for DNS validation"
  value       = module.acm_certificate.cname_name
}

output "dns_validation_cname_value" {
  description = "CNAME value for DNS validation"
  value       = module.acm_certificate.cname_value
}

output "dns_validation_records" {
  description = "All DNS validation records for the certificate"
  value       = module.acm_certificate.validation_records
}
