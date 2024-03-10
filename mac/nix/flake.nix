{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    packages."aarch64-darwin".default = let
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
    in pkgs.buildEnv {
      name = "home-packages";
      paths = with pkgs; [
        amfora
        bat
        cmus
        colima
        curl
        docker
        docker-compose
        eza
        fd
        figlet
        fish
        git
        gnumake
        go
        htop
        httpie
        hugo
        jq
        jump
        lazygit
        lima
        lnav
        lolcat
        neovim
        nmap
        nnn
        ollama
        ripgrep
        shellcheck
        spring-boot-cli
        starship
        tmux
        tree
      ];
    };
  };
}
