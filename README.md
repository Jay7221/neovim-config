# 🚀 Competitive Programming Neovim Configuration

A lightweight, fast, and efficient Neovim setup optimized for competitive programming with **C++**, **Go**, and **Rust**.

## ✨ Features

- **🏃‍♂️ Fast Startup**: Minimal plugin setup with lazy loading
- **⚡ Quick Compile & Run**: One-key compilation and execution
- **🧠 Smart Completion**: LSP-powered autocompletion for Go, Rust (C++ LSP optional)
- **🔍 Efficient Search**: Telescope with fzf for blazing fast file/text search
- **📝 Code Templates**: Quick insertion of competitive programming templates
- **🎨 Clean UI**: Tokyo Night theme with optimized syntax highlighting
- **🔧 Lightweight**: Uses built-in file explorer, minimal dependencies

## 📋 Prerequisites

### Required Tools
```bash
# Core requirements
neovim >= 0.9.0
git
curl or wget

# Language servers and compilers
gcc/g++          # For C/C++
go               # For Go
rustc            # For Rust
ccls             # C/C++ LSP (installed via Mason) - better for competitive programming
gopls            # Go LSP (installed via Mason)
rust-analyzer    # Rust LSP (installed via Mason)

# Optional but recommended
ripgrep (rg)     # For better telescope search
fd               # For faster file finding
make             # For telescope-fzf-native compilation
```

### Installation Commands

**macOS:**
```bash
# Using Homebrew
brew install neovim git ripgrep fd make gcc go rust
```

**Ubuntu/Debian:**
```bash
# Install Neovim (latest)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim git ripgrep fd-find make build-essential

# Install Go
wget https://go.dev/dl/go1.21.0.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

**Arch Linux:**
```bash
sudo pacman -S neovim git ripgrep fd make gcc go rust
```

## 🛠️ Installation

1. **Backup existing config** (if any):
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. **Clone this configuration**:
```bash
git clone <your-repo-url> ~/.config/nvim
```

3. **Start Neovim**:
```bash
nvim
```

4. **Wait for plugins to install** (automatic on first launch)

5. **Install language servers**:
```vim
:Mason
```
Then install: `clangd`, `gopls`, `rust-analyzer`

6. **Configure C++ LSP for competitive programming** (macOS):
```bash
# Run the setup script to configure clangd for bits/stdc++.h
./setup_cpp_lsp.sh

# Restart Neovim after running the script
```

## ⌨️ Key Bindings

### Leader Key
- **Leader**: `<Space>`

### Keybinding Philosophy
This configuration uses a **consistent, mnemonic approach** for competitive programming:

- **`<leader>r`** = **Run/Execute** commands (CompetiTest-focused)
  - `<leader>rr` = Run with CompetiTest (compile & test all cases)
  - `<leader>rc` = Run with CompetiTest
  - `<leader>rd` = Direct run (bypass CompetiTest for quick testing)

- **`<leader>c`** = **Compile-only** commands (syntax checking)
  - `<leader>cc` = Check C++, `<leader>cg` = Build Go, etc.

- **`<leader>t`** = **Template & Testing** commands
  - `<leader>tc` = Template C++, `<leader>tg` = Template Go
  - `<leader>ta` = Add testcase, `<leader>tr` = Run testcases

This approach is **laptop-friendly** (no F-keys) and **language-consistent**!

### File Operations
| Key | Action |
|-----|--------|
| `<leader>e` | Open file explorer |
| `<leader>E` | Open file explorer (vertical split) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fo` | Recent files |
| `<leader>fs` | Search word under cursor |

### Competitive Programming Shortcuts (CompetiTest-focused)
| Key | Action |
|-----|--------|
| `<leader>rr` | **Run with CompetiTest** (compile & test all cases) |
| `<leader>rc` | Run with CompetiTest |
| `<leader>rn` | Run without recompiling |
| `<leader>rd` | Direct run (bypass CompetiTest) |
| `<leader>ru` | Show CompetiTest UI |
| `<leader>rt` | Receive testcases from browser |
| `<leader>rp` | Receive problem from browser |
| `<leader>ri` | Run with input.txt (direct) |
| `<leader>ro` | Run with input.txt → output.txt (direct) |
| `<leader>rv` | Open terminal (vertical split) |
| `<leader>rh` | Open terminal (horizontal split) |

### Compile-Only (Syntax Check)
| Key | Action |
|-----|--------|
| `<leader>cc` | Check C++ syntax |
| `<leader>cb` | Check C syntax |
| `<leader>cg` | Build Go file |
| `<leader>cs` | Check Rust syntax |

### Templates
| Key | Action |
|-----|--------|
| `<leader>tc` | Insert C++ template |
| `<leader>tg` | Insert Go template |
| `<leader>ts` | Insert Rust template |

### CompetiTest (CP Testing)
| Key | Action |
|-----|--------|
| `<leader>ta` | Add testcase |
| `<leader>te` | Edit testcase |
| `<leader>td` | Delete testcase |
| `<leader>tr` | Run testcases |
| `<leader>tu` | Show CompetiTest UI |
| `<leader>tn` | Run testcases (no compile) |
| `<leader>tf` | Convert testcases file format |
| `<leader>tt` | Receive testcases from browser |
| `<leader>tp` | Receive problem from browser |

### Code Navigation & LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Show hover information |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `<leader>d` | Show diagnostic float |

### Editing
| Key | Action |
|-----|--------|
| `jk` | Exit insert mode |
| `<leader>/` | Toggle comment |
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `<leader>nh` | Clear search highlights |

### Window Management
| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Equal window sizes |
| `<leader>sx` | Close current split |
| `<C-h/j/k/l>` | Navigate between splits |

### Tabs
| Key | Action |
|-----|--------|
| `<leader>to` | New tab |
| `<leader>tx` | Close tab |
| `<leader>tn` | Next tab |
| `<leader>tp` | Previous tab |

## 🏗️ Project Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry
├── lua/
│   ├── core/
│   │   ├── options.lua      # Neovim options
│   │   ├── keymaps.lua      # Key bindings
│   │   └── colorscheme.lua  # Theme setup
│   └── plugins/
│       ├── comment.lua      # Commenting functionality
│       ├── completion.lua   # Autocompletion setup
│       ├── cp.lua          # CompetiTest configuration
│       ├── file-explorer.lua # File management
│       ├── lsp.lua         # Language server setup
│       ├── telescope.lua   # Fuzzy finder
│       ├── tmux-navigator.lua # Tmux integration
│       ├── tokyonight.lua  # Color scheme
│       └── treesitter.lua  # Syntax highlighting
├── lazy-lock.json          # Plugin version lock
└── README.md              # This file
```

## 🎯 Quick Start Guide

### 1. Complete CompetiTest Workflow
```bash
# Create a new file
nvim solution.cpp

# Insert template (in normal mode)
<leader>tc

# Write your solution

# Add test cases manually OR receive from browser
<leader>ta    # Add testcase manually
<leader>rt    # Receive testcases from browser (with competitive companion)

# Run all test cases with CompetiTest
<leader>rr    # Compile and run all testcases

# View detailed results
<leader>ru    # Show CompetiTest UI
```

### 2. Alternative: Quick Direct Testing
```bash
# For quick testing without CompetiTest setup
<leader>rd    # Direct compile & run (bypass CompetiTest)

# Or with input file
<leader>ri    # Run with input.txt
<leader>ro    # Run with input.txt → save to output.txt
```

### 3. Browser Integration (Competitive Companion)
```bash
# Install Competitive Companion browser extension
# Then in Neovim:
<leader>rp    # Receive problem from browser
<leader>rt    # Receive testcases from browser

# This automatically sets up the problem with testcases!
```

### 3. Navigate Code Efficiently
```bash
# Find files quickly
<leader>ff

# Search for text in all files
<leader>fg

# Go to function definition
gd

# Show documentation
K
```

## 🔧 Customization

### Compiler Flags
Edit `lua/plugins/cp.lua` to modify compile commands:
```lua
compile_command = {
    cpp = { exec = "g++", args = { "-Wall", "-Wextra", "-std=c++20", "-O2", "$(FNAME)", "-o", "$(FNOEXT)" } },
    -- Add your custom flags here
},
```

### Add New Language Support
1. Install language server via `:Mason`
2. Add configuration in `lua/plugins/lsp.lua`
3. Add compile command in `lua/plugins/cp.lua`

### Change Theme
Edit `lua/plugins/tokyonight.lua` or replace with your preferred colorscheme.

### Custom Key Bindings
Add your keymaps in `lua/core/keymaps.lua`:
```lua
keymap.set("n", "<your-key>", "<your-command>", { desc = "Description" })
```

## 🐛 Troubleshooting

### Common Issues

**1. LSP not working / bits/stdc++.h errors**

**Quick Fix - Disable C++ LSP (Recommended for CP):**
```bash
# Rename the LSP file to use minimal version (no C++ LSP)
cd ~/.config/nvim/lua/plugins
mv lsp.lua lsp-full.lua
mv lsp-minimal.lua lsp.lua

# Restart Neovim
```

**Alternative - Enable C++ LSP:**
```bash
# In Neovim, install a C++ language server:
:Mason
# Install either: clangd OR ccls

# Then edit lua/plugins/lsp.lua and uncomment your preferred LSP
# Restart Neovim: :LspRestart
```

**Why disable C++ LSP for competitive programming?**
- C++ competitive programming uses `bits/stdc++.h` which causes LSP issues
- CompetiTest handles compilation and testing perfectly
- You write short, focused solutions that don't need complex LSP features
- Faster startup and no distracting error squiggles

**2. Telescope not finding files**
```bash
# Install ripgrep and fd for better performance
brew install ripgrep fd  # macOS
sudo apt install ripgrep fd-find  # Ubuntu
```

**3. Compilation errors**
- Ensure compilers are installed and in PATH
- Check compile commands in `lua/plugins/cp.lua`
- Verify file permissions for executables

**4. Plugin installation fails**
```vim
:Lazy sync
# Force reinstall all plugins
```

### Performance Tips

1. **Large files**: Treesitter automatically disables for files > 100KB
2. **Many files**: Use `.gitignore` to exclude build directories
3. **Slow startup**: Check `:Lazy profile` for plugin load times

## 📚 Learning Resources

### Neovim
- [Neovim Documentation](https://neovim.io/doc/)
- [Lua Guide for Neovim](https://github.com/nanotee/nvim-lua-guide)

### Competitive Programming
- [CP-Algorithms](https://cp-algorithms.com/)
- [Codeforces](https://codeforces.com/)
- [AtCoder](https://atcoder.jp/)

## 🤝 Contributing

Feel free to:
- Report bugs
- Suggest improvements
- Add support for more languages
- Share your customizations

## 📄 License

This configuration is free to use and modify for personal and educational purposes.

---

**Happy Competitive Programming! 🏆**
