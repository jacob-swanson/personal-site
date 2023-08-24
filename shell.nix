{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs.buildPackages; [
    ruby
    bundler
    git
    just
    curl
    gnumake
    nixpkgs-fmt
    vim
    less
  ];
  env = {
    LD_LIBRARY_PATH = "${pkgs.curl.out}/lib:$LD_LIBRARY_PATH";
    LANG = "C.UTF-8";
  };
}
