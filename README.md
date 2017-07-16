# setup-vim

Get a usable Vim environment up and running in seconds.

## Installation

Clone the repository, cd in to the directory, run the script.

Warning: this will overwrite any existing `.vimrc` file in your home directory. Back it up if you have a configuration that you want to keep.

**Do it in one convenient command:**

```
git clone https://github.com/nerssi/nf-vim-setup && cd nf-vim-setup && bash ./setup-vim.sh
```

## What does this do?

This script installs:

  1. Pathogen plugin loader.
  2. Autopair plugin.
  3. Command-T plugin.
  4. Gruvbox color scheme.

It enables:
  
  1. 4 space indentation.
  2. The mouse.
  3. Leader key tab switching (Space-h, Space-l for prev and next tab respectively).
  4. Doxygen style comment syntax highlighting.

## Results

![results](https://raw.githubusercontent.com/nerssi/nf-vim-setup/master/example.png)
