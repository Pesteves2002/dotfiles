{
  programs.nixvim.plugins = {
    lsp.servers.yamlls = {
      enable = true;
      settings = {
        redhat = {
          telemetry = {
            enable = false;
          };
        };

        yaml = {
          format = {
            enable = true;
          };

          schemaStore = {
            enable = true;
          };
        };
      };

      onAttach.function = "
      client.server_capabilities.documentFormattingProvider = true
      ";
    };

    schemastore.yaml.enable = true;
  };
}
