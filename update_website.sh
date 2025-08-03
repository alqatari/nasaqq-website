#!/bin/bash

# Quick Website Update Script
# Use this after the initial deployment to push updates

set -e

echo "🔄 Updating Nasaqq Website..."

# Build the latest version
echo "🔨 Building latest version..."
rm -f main.js
elm make src/Main.elm --output=main.js --optimize

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Get commit message from user or use default
if [ -z "$1" ]; then
    COMMIT_MSG="Website update - $(date '+%Y-%m-%d %H:%M:%S')"
else
    COMMIT_MSG="$1"
fi

# Git operations
echo "📦 Committing changes..."
git add .
git commit -m "$COMMIT_MSG"

echo "🚢 Pushing to GitHub..."
git push

echo ""
echo "✅ Website updated successfully!"
echo "🌐 Changes will be live at: https://alqatari.github.io/nasaqq-website"
echo "⏱️  Allow 1-2 minutes for GitHub Pages to rebuild."