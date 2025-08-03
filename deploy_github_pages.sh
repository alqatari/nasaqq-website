#!/bin/bash

# GitHub Pages Deployment Script for Nasaqq Website
# Author: Hussain AlQatari
# Usage: ./deploy-github-pages.sh

set -e  # Exit on any error

# Configuration
GITHUB_USERNAME="alqatari"
REPO_NAME="nasaqq-website"
BRANCH="main"

echo "🚀 Deploying Nasaqq Website to GitHub Pages..."
echo "📋 Configuration:"
echo "   GitHub Username: $GITHUB_USERNAME"
echo "   Repository: $REPO_NAME"
echo "   Branch: $BRANCH"
echo ""

# Step 1: Build the Elm application
echo "🔨 Step 1: Building Elm application..."
if ! command -v elm &> /dev/null; then
    echo "❌ Error: Elm is not installed. Please install Elm first:"
    echo "   npm install -g elm"
    exit 1
fi

# Clean previous build
rm -f main.js

# Build optimized version
elm make src/Main.elm --output=main.js --optimize

if [ $? -eq 0 ]; then
    echo "✅ Elm compilation successful!"
else
    echo "❌ Elm compilation failed!"
    exit 1
fi

# Step 2: Initialize git repository if needed
echo ""
echo "📁 Step 2: Setting up Git repository..."

if [ ! -d ".git" ]; then
    echo "   Initializing new git repository..."
    git init
    echo "   Repository initialized."
else
    echo "   Git repository already exists."
fi

# Step 3: Create/update .gitignore
echo ""
echo "📝 Step 3: Creating .gitignore..."
cat > .gitignore << EOF
# Elm
elm-stuff/

# Build artifacts (we want to commit main.js for GitHub Pages)
# main.js  # Commented out - we need this for GitHub Pages

# Node modules (if any)
node_modules/

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files
.vscode/
.idea/
*.swp
*.swo

# Logs
*.log
npm-debug.log*
EOF

echo "✅ .gitignore created"

# Step 4: Add all files
echo ""
echo "📦 Step 4: Adding files to git..."
git add .

# Step 5: Commit changes
echo ""
echo "💾 Step 5: Committing changes..."
COMMIT_MESSAGE="Deploy Nasaqq website - $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MESSAGE" || echo "No changes to commit"

# Step 6: Set up remote origin
echo ""
echo "🔗 Step 6: Setting up GitHub remote..."
REPO_URL="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

# Check if remote origin exists
if git remote get-url origin &> /dev/null; then
    echo "   Remote origin already exists: $(git remote get-url origin)"
    echo "   Updating remote URL..."
    git remote set-url origin $REPO_URL
else
    echo "   Adding remote origin: $REPO_URL"
    git remote add origin $REPO_URL
fi

# Step 7: Create main branch if needed and push
echo ""
echo "🚢 Step 7: Pushing to GitHub..."

# Ensure we're on the main branch
git branch -M main

# Push to GitHub
echo "   Pushing to origin/$BRANCH..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
else
    echo "❌ Failed to push to GitHub. Please check:"
    echo "   1. Repository exists: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
    echo "   2. You have push access to the repository"
    echo "   3. Your Git credentials are configured"
    exit 1
fi

# Step 8: Instructions for enabling GitHub Pages
echo ""
echo "🎉 Deployment Complete!"
echo ""
echo "📋 Next Steps:"
echo "1. Visit: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo "2. Go to Settings → Pages"
echo "3. Under 'Source', select 'Deploy from a branch'"
echo "4. Choose 'main' branch and '/ (root)' folder"
echo "5. Click 'Save'"
echo ""
echo "🌐 Your website will be available at:"
echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME"
echo ""
echo "⏱️  Note: It may take a few minutes for GitHub Pages to deploy."
echo "    Check the Actions tab for deployment status."
echo ""
echo "🔄 To update your website:"
echo "   1. Make changes to your files"
echo "   2. Run: elm make src/Main.elm --output=main.js --optimize"
echo "   3. Run: git add . && git commit -m 'Update website'"
echo "   4. Run: git push"
echo ""

# Optional: Open GitHub repository in browser (macOS/Linux)
echo "🌍 Opening GitHub repository..."
if command -v open &> /dev/null; then
    # macOS
    open "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
elif command -v xdg-open &> /dev/null; then
    # Linux
    xdg-open "https://github.com/$GITHUB_USERNAME/$REPO_NAME"
else
    echo "Please visit: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
fi

echo ""
echo "✨ Deployment script completed successfully!"