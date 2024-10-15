#!/bin/bash

cd ecs_cluster && terraform destroy -auto-approve && \
cd ../alb && terraform destroy -auto-approve && \
cd ../security_group && terraform destroy -auto-approve && \
cd ../vpc && terraform destroy -auto-approve
