{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs.buildPackages; [
    ruby
    rubyPackages.eventmachine
    bundler
    just
    nixpkgs-fmt
    minify
    nodejs
  ];
  env = {
    LD_LIBRARY_PATH = "${pkgs.curl.out}/lib:$LD_LIBRARY_PATH";
    LANG = "C.UTF-8";
  };
}
