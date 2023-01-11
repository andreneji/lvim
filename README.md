# lunarvim custom settings

## pre requisites
- git / stow gnu linux / [neovim](https://github.com/neovim/neovim) / [lunavim](https://github.com/lunarvim/lunarvim)

## configuration

- clone repo
```bash
git clone git@github.com:andreneji/lvim.git ~/.dotfiles/lvim/.config/
```

- run `stow` to symlink lvim settings.
```bash
cd ~/.dotfiles/
stow -vv lvim
```

- run lunarvim
```bash
lvim ~/.config/lvim/config.lua
```

- type at end of file config.lua
```bash
require("config_custom")
```

- type inside the lunarvim command line
```bash
:packerinstall <enter> + <y>
```
