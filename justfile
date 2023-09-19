set shell := ["nix-shell", "--pure", "--run"]

# Display recipes
@help:
    just --list --unsorted

# Install gems
install-dependencies:
    bundle install

# Start local server
start:
    bundle exec jekyll serve --livereload

# Build
build:
    bundle exec jekyll build

# Clean
clean:
    rm -r _site/ .htmlproofer-cache/

# Update gems
update-dependencies:
    bundle update

# Format supported files
format:
    nixpkgs-fmt shell.nix

# Minify supported files
minify:
    minify -o src/assets/fontawesome/js/brands.min.js src/assets/fontawesome/js/brands.js
    minify -o src/assets/fontawesome/js/solid.min.js src/assets/fontawesome/js/solid.js