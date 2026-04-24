# Dotfiles

## Symlinking

```bash
stow --adopt -vt ~ *
```

---

## Fresh Machine Setup

### 1. System dependencies

```bash
sudo apt update && sudo apt install -y \
  git \
  zsh \
  tmux \
  fzf \
  curl \
  unzip \
  make \
  gcc \
  xclip
```

> On WSL2 skip `xclip` — clipboard goes through `clip.exe` which is built-in.

### 2. Set zsh as default shell

```bash
chsh -s $(which zsh)
```

### 3. Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### Oh My Zsh plugins

```bash
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-vi-mode
git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode
```

### 4. Rust & Cargo

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### 5. Zoxide

```bash
cargo install zoxide
```

### 6. Node (via nvm)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install --lts
```

### 7. Jujutsu (jj)

```bash
cargo install --locked --bin jj jj-cli
```

Then regenerate completions:

```bash
mkdir -p ~/.zsh/completions && jj util completion zsh > ~/.zsh/completions/_jj
```

### 8. Neovim (0.11+)

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Plugins are auto-installed by lazy.nvim on first launch.

Mason auto-installs these tools on first launch:
- `ts_ls` — TypeScript LSP
- `lua_ls` — Lua LSP
- `intelephense` — PHP LSP
- `clangd` — C/C++ LSP
- `dprint` — formatter
- `eslint_d` — linter
- `stylua` — Lua formatter

Mason requires `node`/`npm` for most LSP servers and `unzip`/`curl` for downloads.

### 9. Tmux Plugin Manager (TPM)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Then open tmux and press `prefix + I` to install plugins:
- `tmux-resurrect` — save/restore sessions
- `tmux-continuum` — auto-save sessions every 15 minutes
- `tmux-yank` — clipboard integration

### 10. Alacritty

**Linux** — stow handles it automatically (step 11).

**WSL2** — the config must live on the Windows side. Copy it manually:

```bash
mkdir -p /mnt/c/Users/<your-user>/AppData/Roaming/alacritty
cp ~/.config/alacritty/alacritty.toml /mnt/c/Users/<your-user>/AppData/Roaming/alacritty/alacritty.toml
```

Then add the WSL-specific shell section at the top of that file:

```toml
[terminal.shell]
program = "wsl.exe"
args = ["-d", "Ubuntu", "--cd", "/home/<your-user>"]
```

Also restore the `Ctrl+6` binding for Neovim buffer switching (the control character must be written via script):

```bash
python3 -c "
config = open('/mnt/c/Users/<your-user>/AppData/Roaming/alacritty/alacritty.toml').read().rstrip()
binding = '\n\n[[keyboard.bindings]]\nkey = \"6\"\nmods = \"Control\"\nchars = \"' + '\\\\' + 'u001e\"\n'
open('/mnt/c/Users/<your-user>/AppData/Roaming/alacritty/alacritty.toml', 'w').write(config + binding)
"
```

### 11. Stow dotfiles

```bash
cd ~/.dotfiles
stow --adopt -vt ~ *
```

---

## Key bindings reference

### Tmux (prefix: `Ctrl+a`)

| Key | Action |
|---|---|
| `prefix + r` | Reload config |
| `prefix + \|` | Vertical split |
| `prefix + -` | Horizontal split |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + Ctrl+s` | Save session |
| `prefix + Ctrl+r` | Restore session |

### Neovim

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementations |
| `gR` | References |
| `K` | Hover docs |
| `<leader>rn` | Rename symbol |
| `<leader>vca` | Code action |
| `<leader>ds` | Document symbols |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fmt` | Format buffer |
| `<leader>hs` | Stage hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `]h / [h` | Next/prev git hunk |
| `<leader>a` | Harpoon add file |
| `Ctrl+e` | Harpoon menu |
