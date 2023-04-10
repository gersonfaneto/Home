<h1 align="center">DOTFILES</h1>

<div align="center">

[![Activity](https://img.shields.io/github/last-commit/gersonfaneto/Dotfiles?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/Dotfiles/commit/main)
[![License](https://img.shields.io/github/license/gersonfaneto/Dotfiles?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/gersonfaneto/Dotfiles?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/Dotfiles)

</div>

> "Many computer software programs store their configuration settings in plain, text-based
> files or directories. Dotfiles are configuration files for various programs, and they
> help those programs manage their functionality. What sets them apart from regular files
> and directories is their prefix. Dotfiles are named that way because each file and directory
> starts with a dot (.). On Unix based systems, dotfiles are hidden by the Operating System by
> default."  
> --- _FreeCodeCamp_

<h4 align="center">
  <a href="#usage">Usage</a>
  ·
  <a href="#todo">TODO</a>
  ·
  <a href="#license">License</a>
</h4>

## Usage

This repository uses [`stow`](https://www.gnu.org/software/stow/) to manage the symlinks off all the
files and directories in it, so make sure you have it installed before proceeding.

1. Clone this repository into your local machine.

```bash
$ git clone https://github.com/gersonfaneto/Dotfiles --depth 1
```

2. Inside the new folder, run `stow`.

```bash
$ stow */
```

3. Update the `git` submodules (only needed for `tmux`).

```bash
$ git submodule update --init
```

> **Note**: You can also select individually the folders you want to stow by providing their name.
>
> ```bash
> $ stow nvim
> ```

## TODO

- [ ] `JARVIS.sh` - Basic script for automatic installing configurations, programs and dependencies.

## License

Released under [MIT](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE) by [gersonfaneto](https://github.com/gersonfaneto).
