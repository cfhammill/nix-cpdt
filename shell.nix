{ pkgs ? import <nixpkgs> {} }:


let cpdt = import ./default.nix; in

with pkgs;
mkShell {
  buildInputs = [ git
                  coq
                  (emacsWithPackages (p: with p; [ proofgeneral ]))
                  (with pkgs.coqPackages; [ssreflect equations ])
                  cpdt  
                ];
}       
