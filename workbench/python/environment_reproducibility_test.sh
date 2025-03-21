#!/bin/bash
# environment_reproducibility_test.sh

# Exit on any error
set -e

echo "Deactivating current environment (if active)..."
# This line won't exit the script if deactivate isn't available
deactivate 2>/dev/null || true

echo "Creating environment..."
python -m venv test_env

echo "Activating test environment..."
source test_env/bin/activate

echo "Installing from requirements.txt..."
pip install -r requirements.txt

echo "Running import verification test..."
python workbench/python/test_package_imports.py

echo "Test completed successfully!"
echo "Cleaning up..."
deactivate
rm -rf test_env

echo "Environment reproduced, test passed!"