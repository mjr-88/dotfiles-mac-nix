{ pkgs, username, homeDirectory, ... }:

{

  security.sudo.extraConfig = ''
    ${username} ALL=(root) NOPASSWD: /run/current-system/sw/bin/darwin-rebuild, /nix/store/*/bin/darwin-rebuild
  '';

  # If you use Determinate Nix Installer (recommended), let it manage Nix itself.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [
      "FelixKratz/formulae"
      "nikitabobko/tap"
    ];
    brews = [
      { name = "FelixKratz/formulae/borders"; trusted = true; }
      "btop"
      "topgrade"
      "neovim"
    ];
    casks = [
      "adobe-creative-cloud"
      { name = "nikitabobko/tap/aerospace"; trusted = true; }
      "appcleaner"
      "bambu-studio"
      "bitwarden"
      "curseforge"
      "discord"
      "jordanbaird-ice"
      "keyclu"
      "latest"
      "modrinth"
      "nextcloud"
      "obsidian"
      "rustdesk"
      "shottr"
      "spotify"
      "sublime-text"
      "topnotch"
      "visual-studio-code"
      "ghostty"
      "firefox"
      "battle-net"
    ];
  };

  environment.systemPackages = with pkgs; [
    starship
  ];

  system.primaryUser = username;
  users.users.${username} = {
    home = homeDirectory;
    shell = pkgs.zsh;
  };

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      "com.apple.swipescrolldirection" = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;
      AppleShowAllExtensions = true;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
    };

    trackpad = {
      Clicking = true;
    };
  };

  environment.systemPath = [
    "/run/current-system/sw/bin"
    "/etc/profiles/per-user/${username}/bin"
  ];

  system.stateVersion = 6;
}