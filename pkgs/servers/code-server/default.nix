with import <nixpkgs> {};
with import /Users/elseym/projects/yarn2nix { inherit pkgs; };

let
  yarnPackage = mkYarnPackage rec {
    name = "code-server-${version}";
    version = "1.1140-vsc1.33.1";

    src = "/Users/elseym/projects/code-server";
    # src = fetchFromGitHub {
    #   owner = "codercom";
    #   repo = "code-server";
    #   rev = "${version}";
    #   sha256 = "0jrqwr9zrxwwl5r7m1wcfsca4brxa6zwc2qgnd196dsry4nijc7p";
    # };

    packageJson = "${src}/package.json";
    yarnLock = "${src}/yarn.lock";
  };

  inherit (yarnPackage) deps;

in stdenv.mkDerivation rec {
  name = "code-server-${version}";
  version = "1.1140-vsc1.33.1";

  src = "/Users/elseym/projects/code-server";

  buildInputs = [ yarn python nodejs ];

  buildCommand = ''
    export HOME=$(mktemp -d)
    mkdir -p $out
    cp -r ${src}/* .
    cp -r ${deps}/node_modules .
    chmod -R +w node_modules
    chown -R $(whoami) node_modules
    yarn
    yarn task build:server:binary
  '';
}
