{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs =
    {
      self,
      nix,
      nixpkgs,
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default =
            let
            # https://nixos.org/manual/nixpkgs/stable/#sec-language-ruby
              gems = pkgs.bundlerEnv {
                name = "personal-site";
                gemdir = ./.;
              };
            in
            pkgs.mkShell {
              name = "personal-site";
              nativeBuildInputs = with pkgs; [
                gems
                gems.wrappedRuby
                #                ruby
                #                rubyPackages.eventmachine
                #                bundler
                just
                nixfmt-rfc-style
                minify
                nodejs
                node2nix
                bundix
                nodePackages.postcss
              ];
              env = {
                LD_LIBRARY_PATH = "${pkgs.curl.out}/lib:$LD_LIBRARY_PATH";
                LANG = "C.UTF-8";
              };
            };
        }
      );
    };
}
