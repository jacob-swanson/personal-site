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

# Update dependencies
update-dependencies: update-dependencies-ruby update-dependencies-node

# Update ruby dependencies
update-dependencies-ruby:
    bundle update
    # Generate gemset.nix from Gemfile.lock
    bundle lock
    bundix

# Update node dependencies
update-dependencies-node:
    npm update
    node2nix -l
    rm -r node_modules

# Format supported files
format:
    nixfmt *.nix

# Minify supported files
minify:
    minify -o src/assets/fontawesome/js/brands.min.js src/assets/fontawesome/js/brands.js
    minify -o src/assets/fontawesome/js/solid.min.js src/assets/fontawesome/js/solid.js