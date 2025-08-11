{pkgs, ...}: {
  programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
          enable = true;
          plugins = [ "git" "sudo" ];
      };
      interactiveShellInit = ''
          export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
          ZSH_THEME="edvardm"

          source $ZSH/oh-my-zsh.sh
      '';

      promptInit = "";
  };
}
