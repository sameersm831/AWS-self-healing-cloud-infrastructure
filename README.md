# AWS Self-Healing Cloud Infrastructure

## Overview

This project demonstrates a self-healing AWS infrastructure that automatically detects high CPU utilization on an Amazon EC2 instance and performs automated recovery.

The infrastructure is managed using **Terraform** and uses Amazon CloudWatch for monitoring, Amazon SNS for notifications, AWS Systems Manager for secure instance management and testing, and an automated EC2 reboot action for remediation.

### Self-Healing Workflow

**Monitor → Detect → Notify → Remediate → Recover**

---

## Architecture

```text
                    Amazon EC2
                 CloudRescue-EC2
                 Amazon Linux 2023
                        |
                        | CPUUtilization
                        v
                Amazon CloudWatch
                        |
                     CPU > 80%
                        |
                        v
                 CloudWatch Alarm
              CloudRescue-HighCPU
                   /          \
                  /            \
                 v              v
          Amazon SNS       EC2 Reboot
        Email Notification   Action
                                |
                                v
                         EC2 Recovery
                                |
                                v
                         Alarm → OK

AWS Services
Service	Purpose
Amazon EC2	Hosts the Linux workload
Amazon CloudWatch	Monitors EC2 CPU utilization
CloudWatch Alarm	Detects high CPU conditions
Amazon SNS	Sends email notifications
AWS Systems Manager	Secure instance management and remote testing
Amazon VPC	Provides networking
Amazon EBS	Provides EC2 storage
Terraform	Infrastructure as Code and resource management

EC2 Configuration
Configuration	Value

Operating System	Amazon Linux 2023
Instance Type	t3.micro
Region	ap-south-1
Access	AWS Systems Manager
Monitoring	Amazon CloudWatch
Storage	Amazon EBS
Management	Terraform

CloudWatch Alarm
Alarm Name

CloudRescue-HighCPU-SelfHealing

Configuration
Setting	Value
Namespace	AWS/EC2
Metric	CPUUtilization
Statistic	Average
Period	60 seconds
Threshold	Greater than 80%
Evaluation Periods	2
Datapoints to Alarm	2
Comparison	GreaterThanThreshold
Missing Data	Missing

Alarm Actions

When CPU utilization remains above the configured threshold:

Amazon SNS sends an email notification.

The EC2 reboot action automatically reboots the instance.

Terraform Infrastructure as Code

Terraform was used to bring the existing AWS resources under Infrastructure as Code management.

The following resources are managed by Terraform:

aws_instance.cloudrescue
aws_sns_topic.self_healing_alerts
aws_sns_topic_subscription.email_alerts
aws_cloudwatch_metric_alarm.high_cpu

Existing AWS resources were imported into Terraform state using terraform import.

Terraform Validation

terraform validate

Success! The configuration is valid.

Final Terraform Verification
terraform plan

No changes. Your infrastructure matches the configuration.

This confirms that the real AWS infrastructure matches the Terraform configuration.

Self-Healing Test

The self-healing mechanism was tested by remotely generating high CPU utilization on the Amazon Linux EC2 instance through AWS Systems Manager.

The test used the AWS Systems Manager AWS-RunShellScript document to generate sustained CPU load.

The test successfully produced approximately:

99.99% CPU utilization

Testing Workflow
CPU Load Generated
        |
        v
CPU Utilization ≈ 99.99%
        |
        v
CloudWatch Detects CPU > 80%
        |
        v
Alarm: OK → ALARM
        |
        +------------------> SNS Email Notification
        |
        v
Automatic EC2 Reboot
        |
        v
Reboot Completed Successfully
        |
        v
EC2 Returns to Running State
        |
        v
CloudWatch Alarm → OK

Test Results

High CPU Detection

CloudWatch detected a CPU utilization datapoint of approximately:

99.99333361644676%

The alarm transitioned from OK to ALARM.

SNS Notification

An SNS email notification was successfully received when the CloudWatch alarm entered the ALARM state.

Automated Recovery

CloudWatch alarm history confirmed:

Reboot EC2 Instance 'i-05da00ac8d5dd3707' action completed successfully

EC2 Recovery

After the automated reboot, the instance was verified as:

State: running

Systems Manager

The instance was also verified through Systems Manager:

PingStatus: Online
Platform: Amazon Linux
Final Alarm State

After CPU utilization returned to normal, the CloudWatch alarm returned to:

OK

Terraform Management Workflow
Existing AWS Infrastructure
          |
          v
Terraform Configuration
          |
          v
terraform import
          |
          v
Terraform State
          |
          v
terraform plan
          |
          v
Review Changes
          |
          v
terraform apply
          |
          v
Terraform-Managed Infrastructure
          |
          v
terraform plan
          |
          v
No Changes

Repository Structure
AWS-self-healing-cloud-infrastructure/
│
├── terraform/
│   ├── providers.tf
│   ├── variables.tf
│   ├── data.tf
│   ├── ec2.tf
│   ├── sns.tf
│   ├── sns_subscription.tf
│   ├── cloudwatch.tf
│   └── .terraform.lock.hcl
│
├── .gitignore
└── README.md

Terraform state files and the .terraform directory are excluded from Git using .gitignore.

Temporary CPU testing files were removed before repository finalization.

Skills Demonstrated

AWS
Amazon EC2
Amazon CloudWatch
Amazon SNS
AWS Systems Manager
Amazon VPC
Amazon EBS
IAM fundamentals

Infrastructure as Code
Terraform
Terraform resource management
Terraform import
Terraform state management
Terraform validate
Terraform plan
Infrastructure drift detection

Linux
Amazon Linux
Bash/Shell commands
CPU troubleshooting
Remote command execution

Cloud Operations
Monitoring
Alerting
Threshold-based detection
Automated remediation
Incident recovery
AWS CLI troubleshooting

DevOps
Infrastructure as Code
AWS CLI
Git
GitHub
Automation
Monitoring
Self-healing infrastructure
Key Outcome

The project successfully demonstrates:

Monitor → Detect → Notify → Remediate → Recover

A high CPU condition was intentionally generated on the EC2 instance. CloudWatch detected the condition, triggered the alarm, SNS delivered an email notification, and the configured EC2 reboot action successfully recovered the instance.

The infrastructure was subsequently verified using AWS CLI, Systems Manager, CloudWatch, and Terraform.

Future Improvements
Terraform modules
Remote Terraform state using Amazon S3
Terraform state locking
CloudWatch dashboards
Additional infrastructure health alarms
Systems Manager automated remediation
Auto Scaling integration
Application health monitoring
CI/CD pipeline
GitHub Actions
Automated infrastructure testing
Project Status
Component	Status
EC2 Infrastructure	✅ Completed
CloudWatch Monitoring	✅ Completed
CloudWatch Alarm	✅ Completed
SNS Notification	✅ Completed
SNS Email Subscription	✅ Completed
AWS Systems Manager	✅ Completed
Automated EC2 Recovery	✅ Completed
Self-Healing Test	✅ Completed
Terraform Management	✅ Completed
Terraform Validation	✅ Completed
Terraform Plan Verification	✅ Completed
Documentation	        ✅ Completed
GitHub Finalization	✅ Completed


Conclusion

This project demonstrates how AWS monitoring, alerting, automated remediation, and Infrastructure as Code can be combined to create a resilient self-healing cloud environment.

The implementation successfully detects high CPU utilization, sends an alert, automatically reboots the affected EC2 instance, verifies recovery, and maintains the infrastructure through Terraform.