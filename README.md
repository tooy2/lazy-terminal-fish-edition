# The Lazy Terminal — Fish Edition
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Fish Shell](https://img.shields.io/badge/shell-fish-00A0E6?logo=fish)
![eza](https://img.shields.io/badge/tool-eza-7C3AED)
![Arch Linux](https://img.shields.io/badge/support-Arch-blue?logo=arch-linux)
![Fedora](https://img.shields.io/badge/support-Fedora-294172?logo=fedora)
![Debian/Ubuntu](https://img.shields.io/badge/support-Debian%2FUbuntu-A81D33?logo=debian)

The Lazy Terminal — Fish Edition is a portable Fish shell setup focused on speed and simplicity. It adds smart navigation (cdd and numeric cd), enhanced ls with icons (via eza), and handy pacman/yay wrappers. It works across Arch, Fedora, and Debian/Ubuntu with a one-command installer, and avoids extra theming (no starship) for a clean, lightweight experience.

## Install

```bash
# clone the repo or install it zip
git clone https://github.com/tooy2/lazy-terminal-fish-edition.git
cd lazy-terminal-fish-edition
./install.sh              # non-destructive install
# or
./install.sh --overwrite  # overwrite existing files (backs up with numbered suffixes)
```

After install, start a new Fish session. Optional: make Fish default shell: `chsh -s /usr/bin/fish`.

## Usage
- cdd: list directories with numbers; then use `cd 1`, `cd 2`, etc. to jump.
- ls: shows icons via eza. Variants: `ll` (long), `la` (all), `lt`/`lta` (tree).

## What gets installed
- Functions: cdd, cd, ls, ll, la, lt, lta, pacman, yay, y
- Config: `~/.config/fish/config.fish` (greeting disabled). No starship.

## Dependencies
- Install a Nerd Font (e.g. JetBrains Mono Nerd Font) so icons render correctly.

The installer will try to install `fish` and `eza` using your package manager:
- Arch: pacman
- Fedora: dnf
- Debian/Ubuntu: apt-get
- openSUSE: zypper
If not available, it will attempt to build `eza` via Cargo (installs rustup if needed).

## Uninstall
Remove the copied files from `~/.config/fish/functions/` and optionally restore the backed up `config.fish`.


