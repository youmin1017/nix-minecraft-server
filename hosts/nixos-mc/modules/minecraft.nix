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
          Gugle-Carpet-Additions = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/UHjbX5mk/versions/tIWVNRip/gugle-carpet-addition-mc1.21.5-v2.10.0%2Bbuild.22.jar";
            sha256 = "sha256-iSAMk+Zb05lIIOXma35yh6vtV9kJFR/Ln+E1+ijbIzU=";
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

          # Villager related mods
          Trade-Cycling = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/qpPoAL6m/versions/dirqc2Im/trade-cycling-fabric-1.21.5-1.0.18.jar";
            sha256 = "sha256-aT01Rf99BxGPMxQ+rXm+ipGVNV//k23CBlsxGGEqYLk=";
          };
          Villager-Trade-Stats = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zg7MrtH6/versions/ypAzwn25/VillagerTradeStats-1.0.0%2B1.21.5.jar";
            sha256 = "sha256-gBG0b5QhV77nawJaN8emTDMfCEUQPxgPsXIxltt7cnU=";
          };
          Fast-Trading = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/Ht0RRAt0/versions/iRWqjd2a/fasttrading-0.2.2%2B1.21.5.jar";
            sha256 = "sha256-y9vRceE7ZQkJ+GpH7Qt5VAReaaUZm0tjb7HBH9WvMUA=";
          };
          Visible-Traders = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/AhllI99f/versions/IWSGXIKe/VisibleTraders-0.0.9%2B1.21.5.jar";
            sha256 = "sha256-uO7PrO/iKMM8rgC13EiLw9te+b7iLaxAajcqvTY8Sc8=";
          };
          # Veinminer
          Veinminer = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/OhduvhIc/versions/VDHlG2JK/veinminer-fabric-2.4.2.jar";
            sha256 = "sha256-gNr71pHPAlupLQUxfEW0al1tTRo7qpesHreyy1bRk0I=";
          };
          Silk = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/aTaCgKLW/versions/mIi7Urva/silk-all-1.11.1.jar";
            sha256 = "sha256-+/2k18A3k2ZAoFT4SnQ35McbuxHS//X7z+1zvvzDKts=";
          };
          # Servux: MiniHUD Dependency
          Servux = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/zQhsx8KF/versions/wmkcZoL1/servux-fabric-1.21.5-0.6.1.jar";
            sha256 = "sha256-u0n6IEtK9fkiQi71hqrKxTZJztxICFX72wjGzY3CBKY=";
          };
          # Minimap: Xaero's Minimap
          Xaeros-Minimap = pkgs.fetchurl {
            url = "https://cdn.modrinth.com/data/1bokaNcj/versions/7qxGLo8w/Xaeros_Minimap_25.2.7_Fabric_1.21.5.jar";
            sha256 = "sha256-xuxGRwLPARErXjaL/AyF4rtJ51Pxfm69ZhU7BjHZHq8=";
          };
        }
      );
    };
  };
}
