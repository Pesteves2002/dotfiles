# dotfiles

This is my personal dotfiles repository. It contains configuration files for
various programs I use on a daily basis.

## Installation

To install the dotfiles, run the following command:

```bash
stow *
```

## Wallpapers

The wallpapers are stored in the `wallpapers` directory. They are named
according to the following scheme:

```bash
ls -v | cat -n | while read n f; do mv -n "$f" "$n.jpg"; done

```
