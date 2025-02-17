{pkgs}: let
  kernel_modules = import ./kernel-modules { inherit pkgs; };
in {} // kernel_modules