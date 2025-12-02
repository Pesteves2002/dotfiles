{
  programs.git = {
    enable = true;

    settings = {
      user.name = "Tomás Esteves";
    };

    ignores = [".envrc" ".direnv"];
  };
}
