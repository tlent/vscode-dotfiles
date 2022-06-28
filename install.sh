#!/bin/sh

script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

git clone https://github.com/nushell/nushell.git "$HOME/nushell"
cd "$HOME/nushell"
rustup override set stable || true
cargo install \
        --locked \
        --path . \
        --features stable \
        --root="/usr"
chsh -s "/usr/bin/nu"

nu_config_dir="$HOME/.config/nushell"
cp "$script_dir/config.nu" "$nu_config_dir"
cp "$script_dir/env.nu" "$nu_config_dir"
