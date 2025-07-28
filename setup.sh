#!/bin/bash

echo "🚀 Setting up Portfolio Builder Landing Page..."

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Make sure you're in the landing-page directory."
    exit 1
fi

# Install development dependencies (optional)
if command -v npm &> /dev/null; then
    echo "📦 Installing development dependencies..."
    npm install
else
    echo "⚠️  npm not found. Skipping dependency installation."
fi

# Check for required files
echo "🔍 Checking required files..."

files=("index.html" "sitemap.xml" "robots.txt" "README.md" "LICENSE")
for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file found"
    else
        echo "❌ $file missing"
    fi
done

# Validate HTML
if command -v htmlhint &> /dev/null; then
    echo "🔍 Validating HTML..."
    htmlhint index.html
else
    echo "⚠️  htmlhint not found. Install with: npm install -g htmlhint"
fi

# Check meta tags
echo "🔍 Checking SEO meta tags..."
if grep -q '<title>' index.html; then
    echo "✅ Title tag found"
else
    echo "❌ Title tag missing"
fi

if grep -q 'meta name="description"' index.html; then
    echo "✅ Description meta tag found"
else
    echo "❌ Description meta tag missing"
fi

if grep -q 'meta property="og:' index.html; then
    echo "✅ Open Graph tags found"
else
    echo "❌ Open Graph tags missing"
fi

# Start development server
echo ""
echo "🎉 Setup complete!"
echo ""
echo "To start development server:"
echo "  npm run dev"
echo ""
echo "Or open index.html directly in your browser:"
echo "  open index.html"
echo ""
echo "For deployment:"
echo "  - Vercel: Connect your GitHub repo to Vercel"
echo "  - Netlify: Connect your GitHub repo to Netlify"
echo "  - GitHub Pages: Enable in repository settings"
echo ""
echo "Happy coding! 🚀"
