#############################################
# Lambda
#############################################

module "lambda" {
  source        = "terraform-aws-modules/lambda/aws"
  function_name = "get_mfa_code_function"
  description   = "Use pyotp to get MFA code."
  handler       = "main.lambda_handler"
  runtime       = "python3.7"
  source_path   = "./handler"
  memory_size   = 128
  timeout       = 30
  tags          = var.resource_tags
}