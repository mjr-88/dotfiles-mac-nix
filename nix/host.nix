{ pkgs, ... }:

{
  # If you use Determinate Nix Installer (recommended), let it manage Nix itself.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [ ];
    brews = [
      "borders"
      "btop"
      "topgrade"
    ];
    casks = [
      "adobe-creative-cloud"
      "latest"
      "aerospace"
      "shottr"
      "warp"
      "aerospace"
      "curseforge"
      "modrinth"
      "appcleaner"
      "discord"
      "nextcloud"
      "bambu-studio"
      "jordanbaird-ice"
      "obsidian"
      "topnotch"
      "bitwarden"
      "keyclu"
      "rustdesk"
      "visual-studio-code"
    ];
  };

  environment.systemPackages = with pkgs; [
    starship
  ];

  system.primaryUser = "mjr";
  users.users.mjr = {
    home = "/Users/mjr";
    shell = pkgs.zsh;
  };

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      "com.apple.swipescrolldirection" = false;
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
    "/etc/profiles/per-user/mjr/bin"
  ];

  system.stateVersion = 6;
}
