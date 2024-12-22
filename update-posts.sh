#!/bin/bash

# update-posts.sh - Script to commit and push blog posts changes

# Exit on error
set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "🚀 Starting blog posts update process..."

# Check if we're in a git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo -e "${RED}Error: Not a git repository${NC}"
    exit 1
fi

# Stash any non-post changes to keep them safe
echo "📦 Stashing any non-post changes..."
git stash push -- ":(exclude)posts/*" ":(exclude)public/images/posts/*"

# Add all changes in posts directory
echo "📝 Adding post changes..."
git add -f posts/* public/images/posts/* 2>/dev/null || true

# Check if there are changes to commit
if git diff --cached --quiet; then
    echo -e "${GREEN}No changes to posts detected${NC}"
else
    # Commit changes
    echo "💾 Committing post changes..."
    git commit -m "Update: Blog posts and media content $(date +%Y-%m-%d)"
fi

# Push changes
echo "⬆️ Pushing changes to your repository..."
git push origin $(git branch --show-current)

# Pop stashed changes if any
if git stash list | grep -q "stash@{0}"; then
    echo "🔄 Restoring stashed changes..."
    git stash pop
fi

echo -e "${GREEN}✅ Posts update complete!${NC}"
