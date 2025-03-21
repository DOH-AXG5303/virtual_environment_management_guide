#!/bin/bash

# Create main directories for Posit Workbench and Connect testing
mkdir -p ~/UAT/workbench/python
mkdir -p ~/UAT/workbench/r
mkdir -p ~/UAT/workbench/integration
mkdir -p ~/UAT/connect
mkdir -p ~/UAT/documentation

# Create README files with purpose of each directory
echo "# Posit Workbench Python Testing" > ~/UAT/workbench/python/README.md
echo "# Posit Workbench R Testing" > ~/UAT/workbench/r/README.md
echo "# Cross-language Integration Testing" > ~/UAT/workbench/integration/README.md
echo "# Posit Connect Deployment Testing" > ~/UAT/connect/README.md
echo "# UAT Documentation and Notes" > ~/UAT/documentation/README.md

# Create initial test files
touch ~/UAT/workbench/python/environment_test.py
touch ~/UAT/workbench/python/package_install_test.py
touch ~/UAT/workbench/r/r_test.R
touch ~/UAT/connect/publish_test.py

# Create a testing log file
echo "# UAT Testing Log" > ~/UAT/documentation/testing_log.md
echo "## $(date)" >> ~/UAT/documentation/testing_log.md
echo "Initial setup of UAT environment" >> ~/UAT/documentation/testing_log.md

echo "UAT directory structure created successfully"