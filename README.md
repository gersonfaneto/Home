<h1 align="center">Dotfiles 🔧</h1>

<div align="center">

[![License](https://img.shields.io/github/license/gersonfaneto/Dotfiles?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE)
[![Stars](https://img.shields.io/github/stars/gersonfaneto/Dotfiles?style=for-the-badge&logo=appveyor)](https://github.com/gersonfaneto/Dotfiles)

</div>

> "Many computer software programs store their configuration settings in plain, text-based
> files or directories. Dotfiles are configuration files for various programs, and they
> help those programs manage their functionality. What sets them apart from regular files
> and directories is their prefix. Dotfiles are named that way because each file and directory
> starts with a dot (.) On Unix based systems, dotfiles are hidden by the Operating System by default."  
> --- _FreeCodeCamp_

## Installing

This repository uses [`stow`](https://www.gnu.org/software/stow/) to manage the symlinks off all the
files and directories in it, but you can also just individually symlink the contents of each directory
directly into your `$HOME` directory.

#### Using `Stow`

1. Clone this repository into your local machine.

```bash
$ git clone --depth 1 https://github.com/gersonfaneto/Dotfiles
```

2. Run `Stow` and it will manage all the links.

```bash
$ stow */
```

> **Note**: You can also select individually the folders you want to stow by providing its name
> in place of '\*/':
>
> ```bash
> $ stow nvim
> ```

## License

Released under [MIT](https://github.com/gersonfaneto/Dotfiles/blob/main/LICENSE) by [gersonfaneto](https://github.com/gersonfaneto).
