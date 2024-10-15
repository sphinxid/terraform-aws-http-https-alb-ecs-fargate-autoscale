#!/bin/bash

cd vpc && terraform apply -auto-approve && \
cd ../security_group && terraform apply -auto-approve && \
cd ../alb && terraform apply -auto-approve && \
cd ../ecs_cluster && terraform apply -auto-approve

