{
  pkgs,
  lib,
  config,
  ...
}:
with lib; {
  fonts = {
    fontDir.enable = true;
    ## Then, create a symlink in XDG_DATA_HOME/fonts pointing to /run/current-system/sw/share/X11/fonts, e. g.
    ## ln -s /run/current-system/sw/share/X11/fonts ~/.local/share/fonts

    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    fontconfig = {
      enable = true;
      includeUserConf = false;
    };

    packages = with pkgs;
      [
        # ...
        inconsolata
        terminus_font # for hidpi screens, large fonts

        # Micrsoft free fonts
        ##unfree      corefonts
        ##unfree      vistafonts

        dejavu_fonts
        freefont_ttf
        gentium
        liberation_ttf
        ttf_bitstream_vera

        hermit
        source-code-pro

        crimson
        font-awesome
        # nerdfonts
        (nerdfonts.override {fonts = ["FiraCode" "DroidSansMono"];})

        inter
        manrope
        montserrat
        noto-fonts
        noto-fonts-emoji
        noto-fonts-extra
        powerline-fonts

        # cjk
        # noto-fonts-cjk
        # source-han-sans-japanese
        # source-han-sans-korean
        # source-han-sans-simplified-chinese
        # source-han-sans-traditional-chinese
        # source-han-mono
        # source-han-sans
        # source-han-serif
        # wqy_microhei
        # wqy_zenhei

        # cjk ??
        # ipafont
        # baekmuk-ttf
        # lexend

        source-sans-pro
        symbola
        ubuntu_font_family

        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts

        # ??
        # material-symbols
      ];
  };
}
