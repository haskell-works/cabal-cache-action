FROM ubuntu:18.04

LABEL "com.github.actions.name"="Haskell cabal-cache"
LABEL "com.github.actions.description"="Cache cabal store packages"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="6f42c1"

RUN apt-get update                                                                          &&  \
    apt-get -y install curl                                                                 &&  \
    rm -rf /var/lib/apt/lists/*

RUN curl https://dl.haskellworks.io/binaries/cabal-cache/cabal-cache_x86_64_linux.tar.gz        \
      -o /tmp/cabal-cache_x86_64_linux.tar.gz                                               &&  \
    tar zxvf /tmp/cabal-cache_x86_64_linux.tar.gz -C /usr/local/bin/

CMD ["cabal-cache"]
