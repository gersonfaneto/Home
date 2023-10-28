```markdown
__   __         _         ___        ___     
\ \ / /        /_\       |   \      | _ \       # Yet Another Dotfiles Repo.
 \ V /   _    / _ \   _  | |) |  _  |   /  _ 
  |_|   (_)  /_/ \_\ (_) |___/  (_) |_|_\ (_)   # by @gersonfaneto

```

> **Y.A.D.R.** - "Yet Another Dotfiles Repo". This is the `$HOME` for all the configuration files
> that make my day-to-day as a developer more pleasant.

<div align="center">

[![Commits][commits-shield]][commits-url]
[![License][license-shield]][license-url]
[![Stars][stars-shield]][stars-url]
![Size][size-shield]
[![Distro][distro-shield]][distro-url]

</div>

## Usage

> 📝 **Note**  
> The steps bellow describe how to setup the configuration manually, however if you are on an`Arch`
> based distro you can use the script `JARVIS.sh` to have all the dependencies listed bellow
> installed and the configuration files synchronized automatically.

### Dependencies

Make sure to have the following dependencies installed before proceeding.

```markdown
bat bottom difft eza fd fish fzf git github-cli glow jq kitty lf mediainfo neofetch neovim
python-pdftotext ripgrep rtx starship stow tar texlive tmux trash-cli unzip vimv xh zip zoxide
```

After installing all the packages listed above follow the steps ahead.

- Clone this repository into your local machine.

```shell
git clone https://github.com/gersonfaneto/YADR --depth 1
```

- Update the `bat` themes.

```shell
bat cache --build
```

- Update the font cache.

```shell
fc-cache -fv
```

- Inside the project folder, use `stow` to manage the symbolic links for the configurations.

```shell
stow */ # Link all the folders.
stow neovim # Link only the `neovim` folder.
stow -D neovim # Remove the link for the `neovim` folder.
```

> 📝 **Note**  
> The [`.stowrc`](./.stowrc) file included makes so that no flags are needed to be passed to the
> command line.

## TODOs

- [ ] Fix `JARVIS.sh` - Packages are failing to install. No idea why 🫠.

## License

Released under [MIT][license-url] by [gersonfaneto][profile-url].

<!-- NOTE: Links... -->

[profile-url]: https://github.com/gersonfaneto

[commits-url]: https://github.com/gersonfaneto/YADR/commit/main
[license-url]: https://github.com/gersonfaneto/YADR/blob/main/LICENSE
[stars-url]: https://github.com/gersonfaneto/YADR/stargazers
[distro-url]: https://archlinux.org/

[commits-shield]: https://img.shields.io/github/last-commit/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=git
[license-shield]: https://img.shields.io/github/license/gersonfaneto/YADR?color=blue&style=for-the-badge
[stars-shield]: https://img.shields.io/github/stars/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=github
[size-shield]: https://img.shields.io/github/repo-size/gersonfaneto/YADR?color=blue&style=for-the-badge&logo=github
[distro-shield]: https://img.shields.io/badge/DISTRO-Arch-74c7ec?color=blue&style=for-the-badge&logo=arch-linux
