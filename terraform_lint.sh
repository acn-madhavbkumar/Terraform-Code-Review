#!/bin/bash

# This script performs the following checks on your Terraform configuration:
# 1. Checks Terraform formatting to ensure all files are properly formatted.
# 2. Validates Terraform syntax to ensure the configuration is valid.
# 3. Verifies that sensitive files (e.g., .tfstate) are included in .gitignore.
# 4. Enforces a standard module structure (main.tf, variables.tf, outputs.tf).
# 5. Ensures all variables and outputs have descriptions.
# 6. Checks for hardcoded IPs and excludes common placeholders (e.g., 127.0.0.1).
# 7. Verifies that provider versions are pinned in versions.tf.
# 8. Ensures all resources include proper tagging.
# 9. Allows users to add custom rules for additional checks.

# Exit on any error
set -e

# Function to check formatting
check_formatting() {
  echo "Checking Terraform formatting..."
  terraform fmt -check -recursive
}

# Function to validate syntax
validate_syntax() {
  echo "Validating Terraform syntax..."
  terraform validate
}

# Function to check for sensitive files in .gitignore
check_gitignore() {
  echo "Checking for sensitive files in .gitignore..."
  if ! grep -q "*.tfstate" .gitignore; then
    echo "Warning: .gitignore does not include *.tfstate"
  fi
  if ! grep -q ".terraform/" .gitignore; then
    echo "Warning: .gitignore does not include .terraform/"
  fi
}

# Function to enforce standard module structure
enforce_module_structure() {
  echo "Enforcing standard module structure..."
  for module in modules/*; do
    if [ -d "$module" ]; then
      for file in main.tf variables.tf outputs.tf; do
        if [ ! -f "$module/$file" ]; then
          echo "Error: $file is missing in $module"
          exit 1
        fi
      done
    fi
  done
}

# Function to enforce descriptions for variables and outputs
enforce_descriptions() {
  echo "Enforcing descriptions for variables and outputs..."
  for file in $(find . -name "variables.tf" -o -name "outputs.tf"); do
    if grep -Pzo "variable \".*?\" \{(?![\s\S]*?description)" "$file"; then
      echo "Error: Missing description in variables in $file"
      exit 1
    fi
    if grep -Pzo "output \".*?\" \{(?![\s\S]*?description)" "$file"; then
      echo "Error: Missing description in outputs in $file"
      exit 1
    fi
  done
}

# Function to check for hardcoded IPs
check_hardcoded_ips() {
  echo "Checking for hardcoded IPs..."
  if grep -rE "([0-9]{1,3}\.){3}[0-9]{1,3}" . --exclude-dir=".terraform" | grep -vE "(127\.0\.0\.1|0\.0\.0\.0|255\.255\.255\.255)"; then
    echo "Error: Hardcoded IPs found"
    exit 1
  fi
}

# Function to check for version pinning
check_version_pinning() {
  echo "Checking for version pinning..."
  if ! grep -q "version" versions.tf; then
    echo "Error: Provider version pinning is missing in versions.tf"
    exit 1
  fi
}

# Function to enforce resource tagging
enforce_resource_tagging() {
  echo "Enforcing resource tagging..."
  if ! grep -r "tags" . | grep -q "{"; then
    echo "Error: Resource tagging is missing"
    exit 1
  fi
}

# [EXTENSION POINT] User-defined rules
# Add your custom rules below. Follow the template provided.

# Placeholder for LLM-generated rules
# [LLM_RULE_INSERTION_POINT]

# Add your custom rules to the list below
custom_rules=(
  # Placeholder for LLM-generated rule names
  # [LLM_RULE_ARRAY_UPDATE]
)

# Run all checks
check_formatting
validate_syntax
check_gitignore
enforce_module_structure
enforce_descriptions
check_hardcoded_ips
check_version_pinning
enforce_resource_tagging

# Run custom rules
for rule in "${custom_rules[@]}"; do
  $rule
  echo "$rule passed."
done

echo "All checks passed successfully!"