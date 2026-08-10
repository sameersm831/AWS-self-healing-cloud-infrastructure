#!/bin/bash

# AWS Self-Healing Infrastructure
# Purpose: Generate sustained CPU load for CloudWatch alarm testing.

echo "Starting CPU stress test..."
echo "Expected behavior: CPU utilization should exceed 80%."

stress-ng --cpu 2 --timeout 12m

echo "CPU stress test completed."
