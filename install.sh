#!/bin/sh

git clone https://github.com/nushell/nushell.git "$HOME/nushell"
cd "$HOME/nushell"
rustup override set stable || true
cargo install \
        --locked \
        --path . \
        --features stable \
        --root="/usr"
chsh -s "/usr/bin/nu"
