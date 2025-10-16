# The Lazy Terminal — Fish Edition

![Fish Shell](https://img.shields.io/badge/shell-fish-00A0E6?logo=fish)
![eza](https://img.shields.io/badge/tool-eza-7C3AED)
![Arch Linux](https://img.shields.io/badge/support-Arch-blue?logo=arch-linux)
![Fedora](https://img.shields.io/badge/support-Fedora-294172?logo=fedora)
![Debian/Ubuntu](https://img.shields.io/badge/support-Debian%2FUbuntu-A81D33?logo=debian)

The Lazy Terminal — Fish Edition is a portable Fish shell setup focused on speed and simplicity. It adds smart navigation (cdd and numeric cd), enhanced ls with icons (via eza), and handy pacman/yay wrappers. It works across Arch, Fedora, and Debian/Ubuntu with a one-command installer, and it lightweight.

## Install

```bash
# clone your fork/repo, then:
cd lazy-terminal-fish-edition
./install.sh              # non-destructive install
# or
./install.sh --overwrite  # overwrite existing files (backs up with numbered suffixes)
```

After install, make sure you have a nerd font like jetbrains-mono-nerd or any other nerd font but i recommend to use jetbrains-mono-nerd font because the icons size match the font size 
then ,start a new Fish session. Optional: make Fish default shell: `chsh -s /usr/bin/fish`.

## What gets installed
- Functions: cdd, cd, ls, ll, la, lt, lta.
- Config: `~/.config/fish/config.fish` (greeting disabled).

## Dependencies
The installer will try to install `fish` and `eza` using your package manager:
- Arch: pacman
- Fedora: dnf
- Debian/Ubuntu: apt-get
- openSUSE: zypper
If not available, it will attempt to build `eza` via Cargo (installs rustup if needed).

## Uninstall
Remove the copied files from `~/.config/fish/functions/` and optionally restore the backed up `config.fish`.
## License

This project is licensed under the terms of the [Apache License 2.0](LICENSE).
