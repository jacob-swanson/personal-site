# Display recipes
@help:
    just --list --unsorted

# Enter nix shell
shell:
    nix-shell

# Build site
build:
    bundle exec jekyll build

# Remove site
clean:
    rm -r _site/ .htmlproofer-cache/

# Start local server
start:
    bundle exec jekyll serve --livereload

# Update gems
update-dependencies:
    bundle update

# Install gems
install-dependencies:
    bundle install

# Format files
format:
    nixpkgs-fmt shell.nix