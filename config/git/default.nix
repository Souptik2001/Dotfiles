{ config, pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "souptikdatta2001@gmail.com";
    userName = "Souptik Datta";
    signing = {
      key = "DBF6CC6812FF3147A33F6EAFF2299F86C0303EF8";
      signByDefault = true;
    };
  };
}