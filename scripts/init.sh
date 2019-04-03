#!/bin/bash -e
#
# Init Amazon ECS
#
# Shell script to automate the creation of CloudFormation Stacks on ECS with FARGATE
# More detailed information on README.md file...

################################################################
# Usage: ./init.sh <GitHubUser> <GitHubToken> <S3BucketName> #
################################################################

GitHubUser=$1
GitHubToken=$2
S3BucketName=$3

#### Creating CloudFormation Stack with a container cluster on ECS

aws cloudformation create-stack --stack-name ecs-cluster \
     --template-body file://$PWD/ecs-continuous-delivery.yml \
     --parameters \
        ParameterKey=GitHubUser,ParameterValue=$GitHubUser \
        ParameterKey=GitHubToken,ParameterValue=$GitHubToken \
        ParameterKey=S3BucketName,ParameterValue=$S3BucketName \
     --capabilities CAPABILITY_IAM