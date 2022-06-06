# LunarVim Custom Settings

## Pre Requisites
- git / stow gnu linux / [Neovim](https://github.com/neovim/neovim) / [LunaVim](https://github.com/LunarVim/LunarVim)

## Configuration

- Clone Repo
```bash
git clone git@github.com:andreneji/lvim.git ~/.dotfiles/lvim/.config/
```

- Run `stow` to symlink lvim settings.
```bash
cd ~/.dotfiles/
stow -vv lvim
```

- Run LunarVim
```bash
lvim ~/.config/lvim/config.lua
```

- Type at end of file config.lua
```bash
require("config_custom")
```

- Type Inside the LunarVim command line
```bash
:PackerInstall <Enter> + <y>
```
