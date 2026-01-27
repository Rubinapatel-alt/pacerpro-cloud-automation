# pacerpro-cloud-automation

# PacerPro Cloud Automation - Platform Engineer Coding Test

## Overview

This repository contains the solution for the **PacerPro Platform Engineer - Cloud Infrastructure & Reliability coding test**.  
The goal of this project is to implement a **monitoring and automation solution** that identifies and resolves intermittent performance issues in a web application.

The solution is divided into three parts:

1. **Sumo Logic Query and Alert**  
2. **AWS Lambda Function**  
3. **Infrastructure as Code (IaC) using Terraform**

---

## Part 1: Sumo Logic Query and Alert

- **Objective:** Identify log entries where the `/api/data` endpoint response time exceeds 3 seconds and trigger an alert if more than 5 entries occur within 10 minutes.
- **File:** `sumo_logic_query.txt`
- **Implementation:**  
  - Created a query to filter logs for `/api/data` with response time > 3s.  
  - Configured an alert based on the condition described above.  
  - Recorded my screen while implementing and narrating the steps.

- **Recording:** `SumoLogicRecording.mp4` (available in Google Drive / local link)

---

## Part 2: AWS Lambda Function

- **Objective:** Automatically restart an EC2 instance and send a notification to an SNS topic when triggered by the Sumo Logic alert.
- **Directory:** `lambda_function/`
- **Filename:** `Lambda.py`
- **Terraform handler:** `Lambda.lambda_handler`
- **Functionality:**
  - Receives event from Sumo Logic alert.  
  - Restarts the specified EC2 instance.  
  - Sends notification to the SNS topic:  
    `arn:aws:sns:us-west-2:702986236790:pacerpro-alerts`
  - Logs actions to CloudWatch.  
- **Environment variables:**
  - `EC2_INSTANCE_ID` = `i-0fed479e5fc2aa0c5`  
  - `SNS_TOPIC_ARN` = `arn:aws:sns:us-west-2:702986236790:pacerpro-alerts`
- **Recording:** `LambdaRecording.mp4` (available in Google Drive / local link)

---

## Part 3: Infrastructure as Code (Terraform)

- **Objective:** Deploy the EC2 instance, SNS topic, and Lambda function in a modular and reusable way.
- **Directory:** `terraform/`
- **Modules:**  
  - `modules/ec2/` → Deploy EC2 instance  
  - `modules/sns/` → Create SNS topic  
  - `modules/lambda/` → Deploy Lambda function
- **Root module:** Calls all three modules with the necessary variables.
- **How to deploy:**
  ```bash
  cd terraform
  terraform init
  terraform apply
