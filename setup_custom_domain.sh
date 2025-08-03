#!/bin/bash

# Custom Domain Setup Script for nasaqq.com
# This script adds the CNAME file and deploys it

set -e

echo "🌐 Setting up custom domain: nasaqq.com"
echo ""

# Create CNAME file
echo "📝 Creating CNAME file..."
echo "nasaqq.com" > CNAME
echo "✅ CNAME file created with content: nasaqq.com"

# Build the website
echo ""
echo "🔨 Building website..."
rm -f main.js
elm make src/Main.elm --output=main.js --optimize

if [ $? -ne 0 ]; then
    echo "❌ Build failed!"
    exit 1
fi

echo "✅ Build successful!"

# Commit and push changes
echo ""
echo "📦 Deploying CNAME file and updates..."
git add .
git commit -m "Add custom domain: nasaqq.com"
git push

echo ""
echo "✅ Custom domain setup complete!"
echo ""
echo "📋 What happens next:"
echo "1. DNS propagation: 5-48 hours (usually within 2 hours)"
echo "2. GitHub will automatically detect the CNAME file"
echo "3. SSL certificate will be issued automatically"
echo ""
echo "🌐 Your website will be accessible at:"
echo "   • https://nasaqq.com"
echo "   • https://www.nasaqq.com"
echo "   • https://alqatari.github.io/nasaqq-website (backup)"
echo ""
echo "🔍 To check DNS propagation:"
echo "   • Visit: https://dnschecker.org"
echo "   • Enter: nasaqq.com"
echo ""
echo "⚠️  Note: Until DNS propagates, you may see:"
echo "   • 'This site can't be reached' errors"
echo "   • Certificate warnings (normal initially)"
echo ""

# Check if dig command is available for DNS testing
if command -v dig &> /dev/null; then
    echo "🔧 Testing DNS configuration..."
    echo "Current A records for nasaqq.com:"
    dig +short A nasaqq.com || echo "   DNS not propagated yet"
    echo ""
fi

echo "✨ Setup completed! Check back in 1-2 hours."