# Show help
help:
    just --list --unsorted

# Build nix pkg
build-nix:
    nix build .

# Run nix pkg
start-nix:
    nix run .

# Run dev server
start-dev:
    npm run dev

# Format nix files
fmt-nix:
    nixfmt *.nix