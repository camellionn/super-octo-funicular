with (import <nixpkgs> { });

let

in
mkShell {

  buildInputs = [
    #go
    #gotools
    #gopls
    #go-outline
    #gocode
    #gopkgs
    #gocode-gomod
    #godef
    #golint
    nodejs_20
  ];

  shellHook = ''
    export DOG=🐕
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
    export PATH=$PATH:/opt/atlassian/bin

  '';
}
