terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}

resource "aws_acm_certificate" "main" {
  count = var.domain_name != "" ? 1 : 0

  provider = aws.us_east_1

  domain_name       = var.domain_name
  validation_method = "DNS"

  key_algorithm = "RSA_2048"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.domain_name
  }
}

# resource "aws_acm_certificate_validation" "main" {
#   count = var.domain_name != "" ? 1 : 0
#
#   certificate_arn         = aws_acm_certificate.main[0].arn
#   validation_record_fqdns = [for record in aws_route53_record.cert_validation : record.fqdn]
#
#   timeouts {
#     create = "5m"
#   }
# }
#
# resource "aws_route53_record" "cert_validation" {
#   count = var.domain_name != "" ? length(aws_acm_certificate.main[0].domain_validation_options) : 0
#
#   allow_overwrite = true
#   name            = tolist(aws_acm_certificate.main[0].domain_validation_options)[count.index].resource_record_name
#   records         = [tolist(aws_acm_certificate.main[0].domain_validation_options)[count.index].resource_record_value]
#   ttl             = 60
#   type            = tolist(aws_acm_certificate.main[0].domain_validation_options)[count.index].resource_record_type
#   zone_id         = var.route53_zone_id
# }
