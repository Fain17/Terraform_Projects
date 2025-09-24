output "certificate_arn" {
  description = "ARN of the ACM certificate"
  value       = var.domain_name != "" ? aws_acm_certificate.main[0].arn : ""
}

output "certificate_domain_name" {
  description = "Domain name of the ACM certificate"
  value       = var.domain_name != "" ? aws_acm_certificate.main[0].domain_name : ""
}

output "certificate_status" {
  description = "Status of the ACM certificate"
  value       = var.domain_name != "" ? aws_acm_certificate.main[0].status : ""
}

output "validation_records" {
  description = "DNS validation records for the certificate"
  value = var.domain_name != "" ? [
    for record in aws_acm_certificate.main[0].domain_validation_options : {
      name  = record.resource_record_name
      value = record.resource_record_value
      type  = record.resource_record_type
    }
  ] : []
}

output "cname_name" {
  description = "CNAME name for DNS validation"
  value       = var.domain_name != "" ? tolist(aws_acm_certificate.main[0].domain_validation_options)[0].resource_record_name : ""
}

output "cname_value" {
  description = "CNAME value for DNS validation"
  value       = var.domain_name != "" ? tolist(aws_acm_certificate.main[0].domain_validation_options)[0].resource_record_value : ""
}
