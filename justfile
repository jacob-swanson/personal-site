build:
    bundle exec jekyll build

start:
    bundle exec jekyll serve --livereload

update-dependencies:
    bundle update

install-dependencies:
    bundle install

format:
    nixpkgs-fmt shell.nix