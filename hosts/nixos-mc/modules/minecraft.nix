{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers.wke = {
      enable = true;
      package = pkgs.paperServers.paper-1_21_5;

      serverProperties = {
        gamemode = "survival";
        difficulty = "hard";
        simulation-distance = 10;
        level-seed = "7830518263619659759";
      };

      jvmOpts = "-Xms4G -Xmx8G -XX:+UseG1GC";

      symlinks = {
        # mods = pkgs.linkFarmFromDrvs "mods" (
        #   builtins.attrValues {
        #     Fabric-API = pkgs.fetchurl {
        #       url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/EcYmlIw5/fabric-api-0.128.0%2B1.21.5.jar";
        #       sha256 = "sha256-X3cP7vBKgFGXHKUhqyISGNfGX+zhY9mtr4ee8grCrcs=";
        #     };
        #     Fabric-Language-Kotlin = pkgs.fetchurl {
        #       url = "https://cdn.modrinth.com/data/Ha28R6CL/versions/mccDBWqV/fabric-language-kotlin-1.13.4%2Bkotlin.2.2.0.jar";
        #       sha256 = "sha256-KjxW/B3W6SKpvuNaTAukvA2Wd2Py6VL/SbdOw8ZB9Qs=";
        #     };
        #     # /cs 旁觀者模式
        #     Essential-Addons = pkgs.fetchurl {
        #       url = "https://cdn.modrinth.com/data/3WQaouc1/versions/FOVGYZRM/EssentialAddons-2.0.0%2B1.21.5.jar";
        #       sha256 = "sha256-mJ1AIJ2aG5ryEKeihNeMmkj66sKn7Skp6Tz7nV3oZqI=";
        #     };
        #     Carpet = pkgs.fetchurl {
        #       url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/oXn7up6k/fabric-carpet-1.21.5-1.4.169%2Bv250325.jar";
        #       sha256 = "sha256-RQYsKAkSvlPjWih0RCRygKfxLkn165uaCPlNPPx8goE=";
        #     };
        #     # 優化遊戲物理、生物AI...等等
        #     Lithium = pkgs.fetchurl {
        #       url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/xcELvp6R/lithium-fabric-0.16.3%2Bmc1.21.5.jar";
        #       sha256 = "sha256-ZmG1pQ+8hcYDKMaLq3Nhw69mhbSC87Mk3BDbvc9k4G0=";
        #     };
        #   }
        # );
      };
    };
  };
}
