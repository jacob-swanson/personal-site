{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  buildInputs = with pkgs.buildPackages; [
    ruby
    bundler
    just
    nixpkgs-fmt
  ];
  env = {
    LD_LIBRARY_PATH = "${pkgs.curl.out}/lib:$LD_LIBRARY_PATH";
    LANG = "C.UTF-8";
  };
}
