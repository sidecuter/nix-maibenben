{pkgs}: {
  skr = pkgs.linuxPackages.callPackage ./skr {};
  skr_zen = pkgs.linuxPackages_zen.callPackage ./skr {};
  skr_latest = pkgs.linuxPackages_latest.callPackage ./skr {};
}