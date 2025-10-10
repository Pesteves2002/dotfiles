{
  monitors =
    import
    ./monitors.nix;

  credentials = import ./credentials.nix;

  laptop = import ./laptop.nix;
}
