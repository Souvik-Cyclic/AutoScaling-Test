#!/bin/bash

REPO_URL="https://github.com/Souvik-Cyclic/AutoScaling-Test.git"

echo "Pulling the latest changes from the repository"
git pull $REPO_URL main

echo "Executing the operations script"
chmod +x operations.sh
bash operations.sh