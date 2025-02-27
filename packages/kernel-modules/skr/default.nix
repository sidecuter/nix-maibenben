{ stdenv, lib, fetchFromGitHub, kernel }:

stdenv.mkDerivation rec {
  pname = "mbb_skr";
  version = "0.3";
  name = "${pname}-${version}-${kernel.version}";

  src = fetchFromGitHub {
    owner = "sidecuter";
    repo = "mbb_skr";
    rev = "v${version}";
    hash = "sha256-ngHvsie+8sCYyl189KwD1npXXiavWewgYWSUuXY+ZpY=";
  };
  
  hardeningDisable = [ "pic" "format" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];

  installPhase = ''
    install -D mbb_skr.ko $out/lib/modules/${kernel.modDirVersion}/misc/mbb_skr.ko
  '';

  meta = {
    description = "Maibenben special keys reader ";
    homepage = "https://github.com/sidecuter/mbb_skr";
    license = lib.licenses.gpl2;
    platforms = lib.platforms.linux;
  };
}
