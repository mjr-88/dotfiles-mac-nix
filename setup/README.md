# Bootstrap

Run `setup/mac.sh` on a fresh Mac **after** cloning this repo and **after** replacing the placeholder values in the Nix files.

Typical flow:

1. Clone the repo
2. Replace placeholder values such as:
   - `yourname`
   - `/Users/yourname`
   - `Your Name`
   - `you@example.com`
3. Run:

```bash
bash setup/mac.sh
```

What the script does:

- checks that you replaced the placeholder values first
- installs Determinate Nix Installer if needed
- installs Homebrew if needed
- applies the `nix-darwin` + Home Manager configuration
- installs `nvm` and a default Node.js version if needed

This script is meant for the **first bootstrap on a new Mac**. After that, most ongoing changes should happen by editing the Nix config and running `darwin-rebuild switch --flake ~/github/dotfiles-mac-nix#mac`.
