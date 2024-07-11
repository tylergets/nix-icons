{ inputs, stdenv, lib }: let 

  iconPath = "share/icons/hicolor/scalable/apps";

in
stdenv.mkDerivation rec {
  pname = "devicons";
  version = "1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/${iconPath}
    find ${inputs.devicons}/icons -type f -name "*.svg" -print0 | xargs -0 cp -t $out/${iconPath}
  '';

  meta = with lib; {
    description = "Devicons icon set";
    license = licenses.mit;
  };
}
