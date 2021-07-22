#############################################
# API Gateway
#############################################

module "api_gateway" {
  source                 = "terraform-aws-modules/apigateway-v2/aws"
  name                   = "get-mfa-code-api-gw"
  description            = "To Get MFA Code HTTP API Gateway"
  protocol_type          = "HTTP"
  create_api_domain_name = false
  tags                   = var.resource_tags

  cors_configuration = {
    allow_headers = ["*"]
    allow_methods = ["*"]
    allow_origins = ["*"]
  }

  # Routes and integrations
  integrations = {
    "GET /" = {
      lambda_arn = module.lambda.lambda_function_arn
    }
  }
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${module.api_gateway.apigatewayv2_api_execution_arn}/*/*/*"
}

output "api_gateway_url" {
  value = module.api_gateway.apigatewayv2_api_api_endpoint
}