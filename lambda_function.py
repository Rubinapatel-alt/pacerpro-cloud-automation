import boto3
import logging

# Set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# AWS clients
ec2 = boto3.client('ec2')
sns = boto3.client('sns')
EC2_INSTANCE_ID = "i-0fed479e5fc2aa0c5"  # your EC2 instance ID
SNS_TOPIC_ARN = "arn:aws:sns:us-west-2:702986236790:pacerpro-alerts"  # your SNS topic ARN

def lambda_handler(event, context):
    logger.info("Sumo Logic alert received")
    
    # Reboot EC2 instance
    ec2.reboot_instances(InstanceIds=[EC2_INSTANCE_ID])
    logger.info(f"EC2 instance {EC2_INSTANCE_ID} reboot initiated")

    # Send SNS notification
    sns.publish(
        TopicArn=SNS_TOPIC_ARN,
        Subject="High Latency Alert",
        Message=f"EC2 instance {EC2_INSTANCE_ID} restarted due to high latency on /api/data"
    )
    logger.info(f"SNS notification sent to {SNS_TOPIC_ARN}")

    return {
        "status": "success",
        "instance_id": EC2_INSTANCE_ID,
        "sns_topic": SNS_TOPIC_ARN
    }
