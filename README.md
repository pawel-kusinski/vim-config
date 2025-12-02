# Vim Configuration Setup

This repository contains my Vim setup. The `setup_vim.sh` script takes care of configuring everything, including downloading the plugin manager and installing the plugins.

# Cheat Sheet

## Undoing
Undo:
```vim
u
```
Redo:
```vim
Ctrl-r
```

## Search and Substitution
Replace "foo" with "bar" across the whole file:
```vim
:%s/foo/bar/g
```
Replace "foo" with "bar" across the whole file and ask for confirmation before each replacement:
```vim
:%s/foo/bar/gc
```

## File Navigation
Toggle between current and last file:
```vim
Ctrl-^
```
Reload the current file from disk (discarding unsaved changes):
```vim
:e!
```

## Tag Navigation
Jump to the definition of a tag (e.g., function, variable):
```vim
Ctrl-]
```
Jump back to the previous location in the tag stack:
```vim
Ctrl-t
```
Toggle the Tagbar sidebar (preservim/tagbar plugin)
```vim
<F8>
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
