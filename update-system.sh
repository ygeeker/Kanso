#!/bin/bash

# update-system.sh - Script to update blog system from upstream

# Exit on error
set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "🚀 Starting blog system update process..."

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo -e "${RED}Error: Not a git repository${NC}"
    exit 1
fi

# Check if upstream remote exists
if ! git remote | grep -q "upstream"; then
    echo -e "${YELLOW}Upstream remote not found. Please enter the upstream repository URL:${NC}"
    read -p "URL: " upstream_url
    git remote add upstream $upstream_url
fi

# Stash posts to keep them safe
echo "📦 Saving your posts..."
git stash push -- "posts/*"

# Fetch upstream changes
echo "⬇️ Fetching updates from upstream..."
git fetch upstream

# Determine the main branch of upstream
UPSTREAM_MAIN_BRANCH=""
if git show-ref --verify --quiet refs/remotes/upstream/main; then
    UPSTREAM_MAIN_BRANCH="main"
elif git show-ref --verify --quiet refs/remotes/upstream/master; then
    UPSTREAM_MAIN_BRANCH="master"
else
    echo -e "${RED}Error: Could not find main or master branch in upstream${NC}"
    exit 1
fi

# Merge upstream changes
echo "🔄 Merging updates from upstream/${UPSTREAM_MAIN_BRANCH}..."
if git merge "upstream/${UPSTREAM_MAIN_BRANCH}"; then
    echo -e "${GREEN}System updated successfully!${NC}"
else
    echo -e "${RED}Merge conflicts detected. Please resolve them manually.${NC}"
    echo "After resolving conflicts, run:"
    echo "git add ."
    echo "git commit -m 'Merge: Resolve conflicts with upstream'"
    exit 1
fi

# Pop stashed changes
if git stash list | grep -q "stash@{0}"; then
    echo "🔄 Restoring your posts..."
    git stash pop
fi

# Build and check for Vercel-specific files
if [ -f "vercel.json" ]; then
    echo "🏗️ Running build process..."
    npm install
    npm run build
fi

echo -e "${GREEN}✅ System update complete!${NC}"
echo "🚀 You can now deploy to Vercel with 'vercel deploy'"
