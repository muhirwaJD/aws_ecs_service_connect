#!/bin/bash


# Usage:
#   ./scale_down.sh --all <cluster_name> [region]
#   ./scale_down.sh --service <cluster_name> <service_name> [region]
#   --all: scale down all services in the cluster
#   --service: scale down a specific service in the cluster
#   Default region is eu-west-1.


if [[ "$1" == "--all" ]]; then
  CLUSTER_NAME="$2"
  REGION="${3:-eu-west-1}"
  if [[ -z "$CLUSTER_NAME" ]]; then
    echo "Usage: $0 --all <cluster_name> [region]"
    exit 1
  fi
  SERVICE_ARNS=$(aws ecs list-services --cluster "$CLUSTER_NAME" --region "$REGION" --output text --query 'serviceArns[]')
  if [[ -z "$SERVICE_ARNS" ]]; then
    echo "No services found in cluster $CLUSTER_NAME."
    exit 0
  fi
  for SERVICE_ARN in $SERVICE_ARNS; do
    SVC_NAME=$(basename "$SERVICE_ARN")
    aws ecs update-service \
      --cluster "$CLUSTER_NAME" \
      --service "$SVC_NAME" \
      --desired-count 0 \
      --region "$REGION"
    echo "Scaled down service $SVC_NAME in cluster $CLUSTER_NAME to 0 desired tasks."
  done
elif [[ "$1" == "--service" ]]; then
  CLUSTER_NAME="$2"
  SERVICE_NAME="$3"
  REGION="${4:-eu-west-1}"
  if [[ -z "$CLUSTER_NAME" || -z "$SERVICE_NAME" ]]; then
    echo "Usage: $0 --service <cluster_name> <service_name> [region]"
    exit 1
  fi
  aws ecs update-service \
    --cluster "$CLUSTER_NAME" \
    --service "$SERVICE_NAME" \
    --desired-count 0 \
    --region "$REGION"
  echo "Scaled down service $SERVICE_NAME in cluster $CLUSTER_NAME to 0 desired tasks."
else
  echo "Usage: $0 --all <cluster_name> [region]"
  echo "       $0 --service <cluster_name> <service_name> [region]"
  exit 1
fi