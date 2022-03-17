{ sources ? import ./nix/sources.nix }:
let
  pkgs =
    import sources.nixpkgs {
      overlays = [
      ]; };

  frameworks = pkgs.darwin.apple_sdk.frameworks;

  jdk = pkgs.openjdk11;
in
pkgs.mkShell
{
  nativeBuildInputs = [
  ];

  buildInputs = [
    # JavaScript
    pkgs.nodejs-16_x
    pkgs.nodePackages.eslint
    pkgs.nodePackages.node-gyp
    pkgs.nodePackages.node-gyp-build
    pkgs.yarn
  ] ++ (
    pkgs.lib.optionals pkgs.stdenv.isDarwin [
      frameworks.Security
      frameworks.CoreServices
      frameworks.CoreFoundation
      frameworks.Foundation
      frameworks.AppKit
    ]
  );


  shellHook = ''
    export PATH=node_modules/.bin:$PATH
  '';
}
