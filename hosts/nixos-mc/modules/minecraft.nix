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
      package = pkgs.fabricServers.fabric-1_21_5;

      serverProperties = {
        gamemode = "survival";
        difficulty = "hard";
        simulation-distance = 10;
        level-seed = "-7723232821704547830";
      };

      jvmOpts = "-Xms4G -Xmx8G -XX:+UseG1GC";

      symlinks.mods = pkgs.linkFarmFromDrvs "mods" (
        builtins.attrValues {
          Fabric-API = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/EcYmlIw5/fabric-api-0.128.0%2B1.21.5.jar";
            sha256 = "sha256-X3cP7vBKgFGXHKUhqyISGNfGX+zhY9mtr4ee8grCrcs=";
          };
          Fabric-Language-Kotlin = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/Ha28R6CL/versions/mccDBWqV/fabric-language-kotlin-1.13.4%2Bkotlin.2.2.0.jar";
            sha256 = "sha256-KjxW/B3W6SKpvuNaTAukvA2Wd2Py6VL/SbdOw8ZB9Qs=";
          };
          # /cs 旁觀者模式
          Essential-Addons = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/3WQaouc1/versions/FOVGYZRM/EssentialAddons-2.0.0%2B1.21.5.jar";
            sha256 = "sha256-mJ1AIJ2aG5ryEKeihNeMmkj66sKn7Skp6Tz7nV3oZqI=";
          };
          # game optimization mods
          Carpet = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/TQTTVgYE/versions/oXn7up6k/fabric-carpet-1.21.5-1.4.169%2Bv250325.jar";
            sha256 = "sha256-RQYsKAkSvlPjWih0RCRygKfxLkn165uaCPlNPPx8goE=";
          };
          Carpet-Extra = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/VX3TgwQh/versions/4r4Fpql5/carpet-extra-1.21.5-1.4.170.jar";
            sha256 = "sha256-zFX2DjapU7rNmEfDkbWLEH9I0NEiV2/y0M1ZnK1zi54=";
          };
          # 優化遊戲物理、生物AI...等等
          Lithium = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/xcELvp6R/lithium-fabric-0.16.3%2Bmc1.21.5.jar";
            sha256 = "sha256-ZmG1pQ+8hcYDKMaLq3Nhw69mhbSC87Mk3BDbvc9k4G0=";
          };
          # Memory usage optimizations
          FerriteCore = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/uXXizFIs/versions/CtMpt7Jr/ferritecore-8.0.0-fabric.jar";
            sha256 = "sha256-K5C/AMKlgIw8U5cSpVaRGR+HFtW/pu76ujXpxMWijuo=";
          };
          # backup manager
          TextileBackup = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/wwcspvkr/versions/C73KkDD6/textile_backup-3.1.3-1.21.jar";
            sha256 = "sha256-4i6F8u2bKyzuXZ+UMFbOf7RAhMnqeiUmVI6di68orQ8=";
          };
          Cloth-Config-API = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/9s6osm5g/versions/qA00xo1O/cloth-config-18.0.145-fabric.jar";
            sha256 = "sha256-7GcBJ2Gu6GwUCpEDWMSd28JLhS6YBweUBwVyHhv/Xn8=";
          };

          # Blueprint
          Syncmatica = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/bfneejKo/versions/7Ma32dRR/syncmatica-fabric-1.21.5-0.3.14-sakura.4.jar";
            sha256 = "sha256-P6LTuuwcoK067HGJBqLh2Yla5zGx2vC2RPC269Onre0=";
          };
        }
      );
    };
  };
}
