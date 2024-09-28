let
  dragonflySystem = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL0r4o+OjJ18Ue3L0KfNh7dyMQ+MsFLWAraBuUhH0mDM";

  mkSystem = dir: publicKeys: files:
    builtins.foldl' (acc: file: let
      filePrefix =
        if dir == null
        then ""
        else "${dir}/";
    in
      acc
      ++ [
        {
          name = "${filePrefix}${file}.age";
          value = {inherit publicKeys;};
        }
      ]) []
    files;

  flatten = list: builtins.foldl' (acc: system: acc ++ system) [] list;
  mkSecrets = systems: builtins.listToAttrs (flatten systems);
in
  mkSecrets [
    (mkSystem "dragonfly" [dragonflySystem] ["a"])
  ]
