#!/usr/bin/env bash
set -euo pipefail

# Portable installer for Fish config and functions (no starship).
# Default: do NOT overwrite existing files. Use --overwrite to replace.
# Usage:
#   ./scripts/install.sh [--overwrite]

OVERWRITE=0
if [[ ${1:-} == "--overwrite" ]]; then
  OVERWRITE=1
fi

here() { cd -- "$(dirname -- "$0")/.."; pwd; }
ROOT="$(here)"
SRC_FUNCS="$ROOT/functions"
SRC_CFG="$ROOT/config/config.fish"
DEST_DIR="$HOME/.config/fish"
DEST_FUNCS="$DEST_DIR/functions"

have() { command -v "$1" >/dev/null 2>&1; }

ensure_dirs() {
  mkdir -p "$DEST_FUNCS"
}

copy_file() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && $OVERWRITE -eq 0 ]]; then
    echo "skip  $dst (exists)"
    return 0
  fi
  if [[ -e "$dst" && $OVERWRITE -eq 1 ]]; then
    cp -a --backup=numbered "$src" "$dst"
    echo "update $dst"
  else
    install -Dm0644 "$src" "$dst"
    echo "install $dst"
  fi
}

install_pkgs() {
  # Try to install fish and eza using the system package manager.
  local need=(fish eza)
  local missing=()
  for c in "${need[@]}"; do have "$c" || missing+=("$c"); done
  [[ ${#missing[@]} -eq 0 ]] && return 0

  if have pacman; then
    sudo pacman -S --needed --noconfirm "${missing[@]}"
  elif have dnf; then
    sudo dnf install -y "${missing[@]}"
  elif have apt-get; then
    sudo apt-get update -y
    sudo apt-get install -y "${missing[@]}"
  elif have zypper; then
    sudo zypper install -y "${missing[@]}"
  else
    echo "No supported package manager found. Attempting to build missing tools..."
    build_missing_from_source "${missing[@]}"
  fi
}

build_missing_from_source() {
  local to_build=("$@")
  # Support building eza via cargo if needed
  if printf '%s\n' "${to_build[@]}" | grep -qx eza; then
    if ! have cargo; then
      echo "Installing Rust toolchain (rustup) for building eza..."
      curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
      export PATH="$HOME/.cargo/bin:$PATH"
    fi
    echo "Building and installing eza via cargo..."
    cargo install eza
  fi
}

main() {
  install_pkgs || true
  ensure_dirs

  # Copy functions (non-destructive by default)
  for f in "$SRC_FUNCS"/*.fish; do
    base="$(basename "$f")"
    copy_file "$f" "$DEST_FUNCS/$base"
  done

  # Copy config.fish (non-destructive by default)
  copy_file "$SRC_CFG" "$DEST_DIR/config.fish"

  echo "Done. Start a new Fish session to use the functions."
}

main "$@"
