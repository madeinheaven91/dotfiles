{ config, pkgs, ... }:

{
  imports =
    [
      ./scripts.nix
    ];

	home.username = "madeinheaven91";
	home.homeDirectory = "/home/madeinheaven91";
	home.stateVersion = "25.11";
	home.sessionVariables = {
		EDITOR = "nvim";
	};

	home.packages = with pkgs; [
		alacritty
		waybar
		niri
    swww
		fuzzel
    nautilus
		telegram-desktop

		neovim
		fzf
		ripgrep
		tmux
		btop
    neofetch
    lazygit
    lazydocker
    bat
    starship

    tree-sitter
		gcc
		nodejs
		cargo
		rustc
    rust-analyzer
    rustfmt
    go
    gopls

    nerd-fonts.code-new-roman
	];

	programs.firefox.enable = true;

	programs.git = {
		enable = true;
		settings.user.email = "exspectanss@gmail.com";
		settings.user.name = "madeinheaven91";
	};

	programs.zsh = {
		enable = true;
		syntaxHighlighting.enable = true;
		autosuggestion.enable = true;
		oh-my-zsh = {
			enable = true;
		};
	};

	programs.zoxide = {
		enable = true;
		enableZshIntegration = true;
    options = [ "--cmd cd" ];
	};

  programs.starship.enable = true;
  programs.bat.enable = true;
}
