 let
   nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-25.05";
   pkgs = import nixpkgs { config = {}; overlays = []; };
 in

 pkgs.mkShellNoCC {
   packages = with pkgs; [
     cowsay
     lolcat
   ];

  # Environment variables
   GREETING = "Hello, Nix!";

  # Starting script
   shellHook = ''
     echo $GREETING | cowsay | lolcat
   '';
 }
