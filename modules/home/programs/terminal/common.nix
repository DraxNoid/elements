{ lib, pkgs, ... }: {
    home.packages = with pkgs; [
        ripgrep
        htop
        fd
        zip
        unzip
    ];
}   