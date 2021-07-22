import json
import pyotp
from datetime import datetime

def lambda_handler(event, context):
    
    # Get MFA Code
    try:
        mfa_token = event["queryStringParameters"]["token"]
   
        totp      = pyotp.TOTP(mfa_token)
        countdown = int(totp.interval - datetime.now().timestamp() % totp.interval)
        mfa_code  = totp.now()
            
        return {
            'statusCode': 200,
            'body': json.dumps(
                {
                    'mfa_code': mfa_code,
                    'countdown': countdown
                }
            )
        }
    
    except:
        return {
            'statusCode': 200,
            'body': 'Please provide MFA token, and add it to the /?token=xxxxxxxxxx'
        } 