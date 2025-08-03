#!/bin/bash

echo "🚀 Building Nasaqq Website..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -f main.js

# Build the Elm application
echo "🔨 Compiling Elm application..."
elm make src/Main.elm --output=main.js --optimize

if [ $? -eq 0 ]; then
    echo "✅ Elm compilation successful!"
    echo ""
    echo "🎉 Build complete! Ready to run."
    echo ""
    echo "🔗 To run locally:"
    echo "   python3 -m http.server 8000"
    echo "   Then visit: http://localhost:8000"
else
    echo "❌ Elm compilation failed!"
    echo "Please check your Elm code for errors."
    exit 1
fi
