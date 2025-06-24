# Vim Configuration Setup

This repository contains my Vim setup. The `setup_vim.sh` script takes care of configuring everything, including downloading the plugin manager and installing the plugins.

# Cheat Sheet

## Search and Substitution
Replace "foo" with "bar" across the whole file:
```vim
:%s/foo/bar/g
```
Replace "foo" with "bar" across the whole file and ask for confirmation before each replacement:
```vim
:%s/foo/bar/gc
```

## Spell Checking
Add good word to spellfile:
```vim
zg
```
Mark bad word and save in spellfile:
```vim
zw
```
Suggest corrections:
```vim
z=
```
