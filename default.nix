let pkgs = import <nixpkgs> {}; in

pkgs.stdenv.mkDerivation {
   name = "cpdt";
   src = pkgs.fetchhg {
     url = "http://adam.chlipala.net/cpdt/repo";
     sha256 = "07hhl069957xw2hf9jq9bh0abww6x4pff1cpnymvlrlya4p53ymr";
   };
   patches = [./patches/Makefile.patch ./patches/_CoqProject.patch ./patches/DataStruct.patch ./patches/GeneralRec.patch];   
   buildInputs = [ pkgs.coq_8_10 ] ++ (with pkgs.coq_8_10.ocamlPackages; [ ocaml camlp5 findlib ]);
   configurePhase = ''
     make Makefile.coq 
   '';
   buildPhase = ''
     make -f Makefile.coq all
   '';
   installPhase = ''
     make -f Makefile.coq COQLIB=$out/lib/coq/${pkgs.coq_8_10.coq-version}/ install
   '';
   }
