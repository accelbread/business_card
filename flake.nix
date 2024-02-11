{
  inputs.flakelite.url = "github:nix-community/flakelight";
  outputs = { flakelite, ... }: flakelite ./. {
    package = { stdenv, texliveBasic }: stdenv.mkDerivation {
      name = "business_card";
      src = ./.;
      nativeBuildInputs = [
        (texliveBasic.withPackages (ps: with ps; [
          latexmk
          xkeyval
          etoolbox
          pgf
          qrcode
          parskip
          fontawesome
        ]))
      ];
      buildPhase = "latexmk";
      installPhase = "install -DTm644 business_card.pdf $out";
    };
  };
}
