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
      packageJson = builtins.fromJSON (builtins.readFile ./package.json);
      # https://nixos.org/manual/nixpkgs/stable/#javascript-tool-specific
      buildPackage =
        { pkgs }:
        pkgs.buildNpmPackage {
          pname = packageJson.name;
          version = packageJson.version;
          src = ./.;
          npmDepsHash = "sha256-KffagzwIdkYW4809XUMwczMT0F8xU2SEZhv9cd2JymY=";
          installPhase = ''
            mkdir -p $out
            cp -r dist/* $out/
          '';
        };
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = pkgs.mkShell {
            name = packageJson.name;
            nativeBuildInputs = with pkgs; [
              nixfmt-rfc-style
              nodejs
              prefetch-npm-deps
            ];
          };
        }
      );

      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = buildPackage { inherit pkgs; };
        }
      );

      apps = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          default = {
            type = "app";
            program = toString (
              pkgs.writeShellScript "personal-site" ''
                ${pkgs.python3}/bin/python3 -m http.server -d ${self.packages.${system}.default}/
              ''
            );
          };
        }
      );

      nixosModules.default =
        {
          config,
          lib,
          pkgs,
          ...
        }:
        let
          cfg = config.services.personal-site;
        in
        {
          options.services.personal-site = {
            enable = lib.mkEnableOption "Enable ${packageJson.name}";
            domain = lib.mkOption {
              type = lib.types.str;
            };
            package = lib.mkOption {
              default = buildPackage { inherit pkgs; };
              type = lib.types.package;
            };
          };

          # https://docs.astro.build/en/recipes/docker/#nginx
          config = lib.mkIf cfg.enable {
            services.nginx = {
              enable = true;
              virtualHosts."${cfg.domain}" = {
                root = "${cfg.package}";
                extraConfig = ''
                  index index.html index.htm;
                  error_page 404 /404.html;
                '';
                locations."/404.html" = {
                  root = "${cfg.package}";
                  extraConfig = ''
                    internal;
                  '';
                };
                locations."/" = {
                  tryFiles = "$uri $uri/index.html =404";
                };
              };
            };
          };
        };
    };
}
