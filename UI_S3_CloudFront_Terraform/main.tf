terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source = "./modules/s3"
  
  bucket_name = var.bucket_name
  aws_region  = var.aws_region
}

module "acm_certificate" {
  source = "./modules/acm"
  
  domain_name      = var.domain_name
#  route53_zone_id  = var.route53_zone_id
}

module "cloudfront" {
  source = "./modules/cloudfront"
  
  bucket_domain_name = module.s3_bucket.bucket_domain_name
  bucket_arn         = module.s3_bucket.bucket_arn
  bucket_name        = var.bucket_name
  domain_name        = var.domain_name
  default_root_object = var.default_root_object
  acm_certificate_arn = module.acm_certificate.certificate_arn
}

# Update S3 bucket policy after CloudFront is created
resource "aws_s3_bucket_policy" "main" {
  bucket = module.s3_bucket.bucket_name
  policy = data.aws_iam_policy_document.s3_bucket_policy.json

  depends_on = [module.cloudfront]
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${module.s3_bucket.bucket_arn}/*"
    ]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [module.cloudfront.distribution_arn]
    }
  }
}
