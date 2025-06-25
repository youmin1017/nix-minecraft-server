## Setup

### Download this repo

```sh
$ mkdir ~/.config
$ cd ~/.config
$ nix-shell -p git
$ git clone --recurse-submodules git@github.com:youmin1017/nix-minecraft-server.git nix
```

### Prepare sops key

```sh
$ mkdir -p ~/.config/sops/age/
$ touch ~/.config/sops/age/keys.txt
$ cat > $_ # paste your keys.txt
```

### Copy required hardware-configuration to hosts

```sh
$ cp /etc/nixos/hardware-configuration.nix hosts/nixos-mc/
```

### Build this repo

```
$ export IMPURITY_PATH=$PWD
$ sudo --preserve-env=IMPURITY_PATH nixos-rebuild switch --upgrade --flake .?submodules=1#nixos --impure 
```
