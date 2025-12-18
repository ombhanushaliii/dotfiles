# dotfiles with stow

this repo uses **gnu stow** to manage dotfiles via symlinks.

stow mirrors paths from inside a package directory into `$HOME`.

rule:
everything inside a package must look like it belongs under `~`.

---

## setup

```sh
cd ~
git clone <repo-url> dotfiles
cd dotfiles
```

example 1. config under .config

original location:
```sh
~/.config/fish
```

repo layout:
```
dotfiles/
  fish/
    .config/
      fish/
        config.fish
        functions/
        conf.d/
```

steps:
```sh
mkdir -p ~/dotfiles/kitty/.config
mv ~/.config/fish ~/dotfiles/fish/.config/
cd ~/dotfiles
stow fish
```

result:
```
~/.config/fish -> ~/dotfiles/fish/.config/fish
```

example 2. config directly in home
```
~/.zshrc
```

repo layout:
```
dotfiles/
  zsh/
    .zshrc
```

steps:
```sh
mv ~/.zshrc ~/dotfiles/zsh/
cd ~/dotfiles
stow zsh
```

result:
```
~/.zshrc -> ~/dotfiles/zsh/.zshrc
```

## notes
one package per app

never stow the entire .config

target path must not exist before stowing

edit configs via their normal paths under ~

to undo:
```sh
stow -D <package>
```

## setup on a new machine

### prerequisites
```sh
sudo pacman -S stow    # or your distro equivalent
```

clone the repo
```sh
cd ~
git clone <repo-url> dotfiles
cd dotfiles
```

### stow configs

stow only what you need. do not stow everything blindly.

example:

```sh
stow fish
stow zsh
stow kitty
```

this creates symlinks like:
```
~/.config/fish -> ~/dotfiles/fish/.config/fish
~/.zshrc       -> ~/dotfiles/zsh/.zshrc
```

### important
target paths must not already exist

if they do:
```sh
rm -rf ~/.config/fish
```

### remove a config
```sh
stow -D fish
```

done.

