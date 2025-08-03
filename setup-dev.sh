#!/bin/bash

# Development Environment Setup for Nasaqq Website
# This script sets up elm-live for hot reloading during development

set -e

echo "🔧 Setting up Nasaqq Website Development Environment..."
echo ""

# Check if Node.js is installed
if ! command -v npm &> /dev/null; then
    echo "❌ Node.js/npm is required but not installed."
    echo "📦 Please install Node.js from: https://nodejs.org/"
    echo "   Or use: brew install node (on macOS)"
    exit 1
fi

echo "✅ Node.js found: $(node --version)"
echo "✅ npm found: $(npm --version)"

# Check if Elm is installed
if ! command -v elm &> /dev/null; then
    echo "❌ Elm is required but not installed."
    echo "📦 Installing Elm globally..."
    npm install -g elm
else
    echo "✅ Elm found: $(elm --version)"
fi

# Install development dependencies
echo ""
echo "📦 Installing development dependencies..."
npm install

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully!"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo ""
echo "🎉 Development environment setup complete!"
echo ""
echo "🚀 Available commands:"
echo "   npm run dev          - Start development server with live reload"
echo "   npm run dev-debug    - Start development server with Elm debugger"
echo "   npm run build        - Build optimized production version"
echo "   npm run build-debug  - Build development version"
echo "   npm run deploy       - Deploy to GitHub Pages"
echo "   npm run clean        - Clean build files"
echo ""
echo "💻 To start developing:"
echo "   npm run dev"
echo ""
echo "📝 Features you'll get:"
echo "   ✅ Automatic recompilation on file changes"
echo "   ✅ Live reload in browser"
echo "   ✅ Automatic browser opening"
echo "   ✅ Error messages in terminal and browser"
echo "   ✅ Fast development cycle"
echo ""

# Test that everything works
echo "🧪 Testing build..."
npm run build-debug

if [ $? -eq 0 ]; then
    echo "✅ Test build successful!"
    echo ""
    echo "🎯 Ready to develop! Run: npm run dev"
else
    echo "❌ Test build failed. Please check your Elm code."
    exit 1
fi