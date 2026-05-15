if status is-interactive
    abbr -a hx helix
    abbr -a el eza -l --icons
    abbr -a ea eza -la --icons
    abbr -a ff fastfetch
    abbr -a cc cargo check
    abbr -a cb cargo build
    abbr -a cr cargo run
    abbr -a ct cargo test
    fish_add_path ~/.local/bin
end

starship init fish | source
fzf --fish | source
zoxide init fish | source
# TODO jj completions
