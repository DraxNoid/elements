{ options, lib, ...}: {
  imports = [
    ./desktop-environments
    ./programs
  ];

  options.shared = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Shareds settings";
  };
  
}