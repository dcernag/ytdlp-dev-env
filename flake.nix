{
  description = "Development environment for yt-dlp";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs = { self, systems, nixpkgs, ... }:
    let
      forEachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      devShells = forEachSystem (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              uv
              bun # Provides the JS runtime required by yt-dlp
              ffmpeg_7-headless
            ];

            shellHook = ''
              unset SOURCE_DATE_EPOCH
              export VIRTUAL_ENV="$PWD/.venv"
              export PATH="$VIRTUAL_ENV/bin:$PATH"
              uv sync --quiet
            '';          };
        });
    };
}
