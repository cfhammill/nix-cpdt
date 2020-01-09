{ pkgs ? import <nixpkgs> {} }:


let cpdt = import ./default.nix; in

with pkgs;
mkShell {
  buildInputs = [ git
                  coq_8_10
                  (emacsWithPackages (p: with p; [ proofgeneral ]))
                  (with pkgs.coqPackages_8_10; [ssreflect
                                           equations
                                           coq-extensible-records ])
                  cpdt  
                ];
}       
