resource "aws_cloudfront_origin_access_control" "main" {
  name                              = "${var.bucket_name}-oac"
  description                       = "OAC for ${var.bucket_name}"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

resource "aws_cloudfront_distribution" "main" {
  origin {
    domain_name              = var.bucket_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.main.id
    origin_id                = "S3-${var.bucket_name}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object

  aliases = var.domain_name != "" && var.domain_name != "example.com" ? [var.domain_name] : []

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "S3-${var.bucket_name}"
    compress               = true
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  custom_error_response {
    error_code         = 403
    response_code      = 200
    response_page_path = "/index.html"
  }

  custom_error_response {
    error_code         = 404
    response_code      = 200
    response_page_path = "/index.html"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn != "" && var.domain_name != "" && var.domain_name != "example.com" ? var.acm_certificate_arn : null
    ssl_support_method       = var.acm_certificate_arn != "" && var.domain_name != "" && var.domain_name != "example.com" ? "sni-only" : null
    minimum_protocol_version = var.acm_certificate_arn != "" && var.domain_name != "" && var.domain_name != "example.com" ? "TLSv1.2_2021" : null

    cloudfront_default_certificate = var.acm_certificate_arn == "" || var.domain_name == "" || var.domain_name == "example.com"
  }

  tags = {
    Name = "${var.bucket_name}-cloudfront"
  }
}
