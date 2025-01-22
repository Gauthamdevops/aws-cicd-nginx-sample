#!/bin/bash

REPO_URL="https://github.com/Gauthamdevops/aws-cicd-nginx-sample.git"
BRANCH_STAGING="staging"
BRANCH_PROD="production"

GITHUB_TOKEN="$GITHUB_TOKEN"

cd /root/aws-cicd-nginx-sample

# fetch changes from origin
git fetch origin

# Checkout to staging branch
git checkout $BRANCH_STAGING

# Pull the latest changes from staging
git pull origin $BRANCH_STAGING

# Checkout to production branch
git checkout $BRANCH_PROD

# Pull the latest changes from production
git pull origin $BRANCH_PROD

# Merge staging into production branch
git merge origin/$BRANCH_STAGING --no-ff -m "Automated merge from staging to production"

# Pushing merged production branch to GitHub
git push -u origin $BRANCH_PROD

if [ $? -eq 0 ]; then
        echo "Successfully merged code from staging branch to Production Branch..."
else
        echo "Failed to merge/push!!!"
fi
