[private]
list:
    @just --list

# Scan the repo and its git history for secrets
gitleaks:
    gitleaks git --redact --verbose

# Audit the GitHub Actions workflows
zizmor:
    zizmor .

# Check Swift sources against the lint and formatting rules
lint:
    swift format lint --strict --recursive .

# Format Swift sources in place
format:
    swift format --in-place --recursive .
