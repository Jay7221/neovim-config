#!/bin/bash

# Script to set up C++ LSP for competitive programming on macOS
# This finds the correct GCC include paths and creates a .ccls config

echo "Setting up C++ LSP (ccls) for competitive programming..."

# Find GCC installation
GCC_PATH=$(which g++-15 2>/dev/null || which g++-14 2>/dev/null || which g++-13 2>/dev/null)

if [ -z "$GCC_PATH" ]; then
    echo "Error: GCC not found. Please install GCC via Homebrew:"
    echo "brew install gcc"
    exit 1
fi

echo "Found GCC at: $GCC_PATH"

# Get GCC include paths
GCC_INCLUDES=$(echo | $GCC_PATH -E -Wp,-v -x c++ - 2>&1 | grep "^ " | sed 's/^ //' | grep -E "(c\+\+|gcc)" | head -5)

echo "GCC include paths:"
echo "$GCC_INCLUDES"

# Create .ccls configuration
cat > .ccls << EOF
# CCLS Configuration for Competitive Programming
# Use g++-15 as the compiler
%c $GCC_PATH
%cpp $GCC_PATH

# Compiler flags for competitive programming
-std=c++20
-Wall
-Wextra
-O2

# Suppress common competitive programming warnings
-Wno-unused-variable
-Wno-unused-parameter
-Wno-sign-compare
-Wno-unused-but-set-variable

EOF

# Add each include path
while IFS= read -r path; do
    if [ ! -z "$path" ]; then
        echo "-I$path" >> .ccls
    fi
done <<< "$GCC_INCLUDES"

echo "Created .ccls configuration file"

# Test if bits/stdc++.h is accessible
echo "Testing bits/stdc++.h accessibility..."
echo '#include <bits/stdc++.h>' | $GCC_PATH -x c++ -fsyntax-only - 2>/dev/null

if [ $? -eq 0 ]; then
    echo "✅ bits/stdc++.h is accessible with GCC"
else
    echo "❌ bits/stdc++.h not found. You may need to install GCC properly."
fi

echo "Setup complete! Restart Neovim for changes to take effect."
echo "If you still see errors, run: :LspRestart in Neovim"
