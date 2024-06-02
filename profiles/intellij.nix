{
  config,
  pkgs,
  ...
}: {
  home.packages = [
    (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea-ultimate ["github-copilot"])
    pkgs.github-copilot-intellij-agent
  ];

  # Symbolic link the agent to the correct location
  # ln -fs /run/current-system/sw/bin/copilot-agent ~/.local/share/JetBrains/IntelliJIdea2024.1/github-copilot-intellij/copilot-agent/bin/copilot-agent-linux
}
