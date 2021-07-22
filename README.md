# mfa-api-tool
Use the API Gateway to get MFA code

## Prerequisites

- Install terraform
- Install AWS CLI
- Set AWS credential in your environment, 
  ```aws configure  --profile your_profile_name```

## Configuration

Modify ```terraform.tfvars.template``` to ```terraform.tfvars```, and set the tfvars

- aws_profile = "your aws profile"
- aws_region  = "your aws default region"
- resource_tags.project = "your project name"

## Deploy & Delete resources

- Deploy resources:

   `terraform init`

   `terraform plan`

   `terraform apply` 

- Delete resources:

   `terraform destroy`

## Resources

- API Gateway 
- Lambda Function
- IAM Role
- IAM Policy
- Cloudwatch Log Group

## How to use this API

- After deploy, get output api_gateway_url
  
- Add /?token=xxxxxxxxxx behind api gateway url

- Ex: https://xxxxxxxxxx.execute-api.us-east-1.amazonaws.com/?token=xxxxxxxxxx

- Change your token which you want to get the MFA code

- Type the URL in your browser, you will get the response
  ```{"mfa_code": "237533", "countdown": 26}```

- Congratulations, you can get the MFA code now