{config, ...}: {
  networking.interfaces.${config.networking.wiredInterface}.wakeOnLan.enable = true;
}
