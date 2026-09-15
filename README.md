# nvim config

Neovim setup built on lazy.nvim and coc.nvim (TypeScript, JavaScript, Vue, HTML, JSON, ESLint), with Telescope, neo-tree, bufferline, lualine, gitsigns, fugitive, treesitter and codecompanion.

## Requirements

- Neovim 0.11+
- git
- Node.js, for coc.nvim
- ripgrep (`rg`), for Telescope live grep
- make and a C compiler, for telescope-fzf-native and treesitter parsers
- A Nerd Font set as your terminal font, for icons
- `ANTHROPIC_API_KEY` in your environment, for codecompanion chat

On macOS:

```sh
xcode-select --install                     # make + C compiler
brew install neovim git node ripgrep
brew install --cask font-jetbrains-mono-nerd-font
```

## Install

```sh
mv ~/.config/nvim ~/.config/nvim.bak       # only if a config already exists
git clone git@github.com:niuee/nvim-config.git ~/.config/nvim
nvim
```

On first start lazy.nvim installs the plugins, coc.nvim installs its extensions and treesitter compiles its parsers. Restart Neovim once that finishes. To pin plugins to the exact versions in `lazy-lock.json`, run `:Lazy restore`.
