project := trim(read(".project_name"))
destination := "platform=iOS Simulator,name=iPhone 17"
results := "build/TestResults.xcresult"
min_coverage := trim(read(".minimum_coverage"))

[private]
list:
    @just --list

# Build the app for the iOS simulator
build:
    xcodebuild build -project "{{project}}/{{project}}.xcodeproj" -scheme "{{project}}" -destination "{{destination}}"

# Run the unit and UI tests on the iOS simulator
test:
    xcodebuild test -project "{{project}}/{{project}}.xcodeproj" -scheme "{{project}}" -destination "{{destination}}"

# Run the tests and fail if app line coverage is below min percent
coverage min=min_coverage:
    rm -rf "{{results}}"
    xcodebuild test -project "{{project}}/{{project}}.xcodeproj" -scheme "{{project}}" -destination "{{destination}}" -resultBundlePath "{{results}}"
    xcrun xccov view --report --only-targets "{{results}}"
    xcrun xccov view --report --json "{{results}}" | jq -er --arg target "{{project}}.app" --argjson min "{{min}}" \
        '.targets[] | select(.name == $target) | .lineCoverage * 10000 | round / 100 | if . >= $min then "Coverage \(.)% meets the \($min)% minimum" else error("Coverage \(.)% is below the \($min)% minimum") end'

# Scan the repo and its git history for secrets
gitleaks:
    gitleaks git --redact --verbose

# Setup repository
setup:
    brew bundle install
    prek install

# Audit the GitHub Actions workflows
zizmor:
    zizmor .

# Check Swift sources against the lint and formatting rules
lint:
    swift format lint --strict --recursive .

# Format Swift sources in place
format:
    swift format --in-place --recursive .

# Rename the project everywhere, e.g. just rename "My App"
rename new_name:
    #!/usr/bin/env bash
    set -euo pipefail
    old="{{project}}"
    new="{{new_name}}"
    if [[ -z "$new" || "$new" == "$old" ]]; then
        echo "error: give a new name different from \"$old\"" >&2
        exit 1
    fi
    if [[ -e "$new" ]]; then
        echo "error: \"$new\" already exists" >&2
        exit 1
    fi
    # Xcode derives the module name (underscores) and bundle ID suffix (hyphens) from the name.
    old_id="${old//[^A-Za-z0-9]/_}"
    new_id="${new//[^A-Za-z0-9]/_}"
    old_dash="${old//[^A-Za-z0-9]/-}"
    new_dash="${new//[^A-Za-z0-9]/-}"

    grep -rlIF --exclude-dir=.git --exclude-dir=.claude -e "$old" -e "$old_id" -e "$old_dash" . |
        while IFS= read -r file; do
            OLD="$old" NEW="$new" OLD_ID="$old_id" NEW_ID="$new_id" OLD_DASH="$old_dash" NEW_DASH="$new_dash" \
                perl -pi -e 's/\Q$ENV{OLD}\E/$ENV{NEW}/g; s/\Q$ENV{OLD_ID}\E/$ENV{NEW_ID}/g; s/\Q$ENV{OLD_DASH}\E/$ENV{NEW_DASH}/g' "$file"
        done

    find . -depth \( -name "*$old*" -o -name "*$old_id*" -o -name "*$old_dash*" \) -not -path "./.git/*" |
        while IFS= read -r path; do
            base="$(basename "$path")"
            base="${base//"$old"/$new}"
            base="${base//"$old_id"/$new_id}"
            base="${base//"$old_dash"/$new_dash}"
            mv "$path" "$(dirname "$path")/$base"
        done
    echo "Renamed \"$old\" to \"$new\""
