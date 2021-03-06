#!/bin/bash
cd /home/ec2-user
# Create a folder
yum install perl-Digest-SHA -y
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.293.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.293.0/actions-runner-linux-x64-2.293.0.tar.gz
echo "06d62d551b686239a47d73e99a557d87e0e4fa62bdddcf1d74d4e6b2521f8c10  actions-runner-linux-x64-2.293.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.293.0.tar.gz
chown -R ec2-user /home/ec2-user/actions-runner
runuser -l  ec2-user -c '/home/ec2-user/actions-runner/config.sh --url <github repo url> --token <token> --unattended --labels dynatracedemo'
cd /home/ec2-user/actions-runner
./svc.sh install
./svc.sh start
