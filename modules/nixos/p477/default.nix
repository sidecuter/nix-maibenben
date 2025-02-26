{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit (lib) mkIf mkEnableOption;
  cfg = config.hardware.maibenben.p477;
in {
  options.hardware.maibenben.p477 = {
    enable = mkEnableOption "maibenben-p477 hardware tweaks";
  };
  config = let
    mbb-skr = pkgs.callPackage ../../../packages/kernel-modules/skr {
      kernel = config.boot.kernelPackages.kernel;
    };
  in mkIf cfg.enable {
    boot.extraModulePackages = [
      mbb-skr
    ];
    boot.kernelModules = ["mbb_skr"];
  };
}
