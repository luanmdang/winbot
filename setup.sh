#!/bin/bash

echo "=========================================="
echo "winbot Setup Script"
echo "=========================================="
echo ""

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Error: Python 3 is not installed"
    echo "Please install Python 3.8+ and try again"
    exit 1
fi

echo "✓ Python 3 found"

# Create virtual environment
echo ""
echo "Creating virtual environment..."
python3 -m venv venv

if [ $? -ne 0 ]; then
    echo "❌ Error: Failed to create virtual environment"
    exit 1
fi

echo "✓ Virtual environment created"

# Activate virtual environment
echo ""
echo "Activating virtual environment..."
source venv/bin/activate

if [ $? -ne 0 ]; then
    echo "❌ Error: Failed to activate virtual environment"
    exit 1
fi

echo "✓ Virtual environment activated"

# Install dependencies
echo ""
echo "Installing dependencies..."
pip install -r requirements.txt

if [ $? -ne 0 ]; then
    echo "❌ Error: Failed to install dependencies"
    exit 1
fi

echo "✓ Dependencies installed"

# Copy config template
echo ""
if [ -f "config.yaml" ]; then
    echo "⚠️  Warning: config.yaml already exists, skipping copy"
else
    echo "Copying config template..."
    cp config-example.yaml config.yaml
    echo "✓ config.yaml created from template"
fi

# Final instructions
echo ""
echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Get the shared credentials from Luan (via Signal or secure method)"
echo "2. Edit config.yaml and paste in the credentials"
echo "3. Run the bot with: python winbot.py"
echo ""
echo "To activate the virtual environment in the future, run:"
echo "  source venv/bin/activate"
echo ""
echo "See SETUP.md for more detailed instructions."
echo ""
