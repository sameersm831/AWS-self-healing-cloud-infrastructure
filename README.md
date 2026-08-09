\# AWS Self-Healing Cloud Infrastructure



A Cloud and DevOps-focused AWS project demonstrating automated monitoring, alerting, and remediation of EC2 infrastructure using Infrastructure as Code.



\## Project Objective



The objective of this project is to build an AWS EC2 environment capable of detecting abnormal CPU utilization and automatically recovering the workload through CloudWatch-based remediation.



\## AWS Services



\* Amazon EC2

\* AWS Systems Manager Session Manager

\* Amazon CloudWatch

\* Amazon SNS

\* Terraform



\## Self-Healing Workflow



High CPU utilization

&#x20;       ↓

CloudWatch CPU alarm

&#x20;       ↓

ALARM state

&#x20;       ↓

SNS notification

&#x20;       ↓

EC2 reboot action

&#x20;       ↓

EC2 recovery

&#x20;       ↓

CloudWatch returns to OK

```



\## Infrastructure as Code



Terraform is used to define and manage the AWS infrastructure so that the environment can be recreated without manually configuring every resource through the AWS Console.



\## Testing



The self-healing workflow was tested by intentionally generating high CPU utilization on the EC2 instance using `stress-ng`.



\## Project Status



AWS infrastructure successfully tested.



Terraform implementation in progress.



