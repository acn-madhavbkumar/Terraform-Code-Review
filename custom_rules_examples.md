# Examples of Custom Rules for `terraform_lint.sh`

This document provides a template for adding custom rules to the `terraform_lint.sh` script. Users can define their own rules based on project-specific requirements.

## How to Add Custom Rules
1. Open the `terraform_lint.sh` script.
2. Locate the `[EXTENSION POINT]` section.
3. Add your custom rule function. Use the following format:
   ```bash
   # [LLM_RULE_INSERTION_POINT]
   custom_rule_new_rule() {
     # Rule logic here
   }
   ```
4. Add the rule name to the `custom_rules` array at the `[LLM_RULE_ARRAY_UPDATE]` extension point. Only rules added to this array will be invoked.
   ```bash
   # [LLM_RULE_ARRAY_UPDATE]
   custom_rules=(
     ...existing rules...
     custom_rule_new_rule
   )
   ```
5. Save the file and re-run the script:
   ```bash
   ./terraform_lint.sh
   ```

## Notes
- Always test new rules before applying them in production.
- Exclude irrelevant directories (e.g., `.terraform`) to avoid false positives.
- Customize rules to fit your organization's policies and best practices.