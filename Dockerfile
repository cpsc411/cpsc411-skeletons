FROM amd64/ubuntu:20.04

WORKDIR /app

# Due to Docker's caching model, only append RUNs to the end of this
# during "production".
# Minmizie RUNs before a new "release".

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install wget binutils git nasm software-properties-common -y
RUN DEBIAN_FRONTEND=noninteractive apt-get clean -y
RUN wget https://download.racket-lang.org/releases/8.7/installers/racket-8.7-x86_64-linux-cs.sh
RUN echo yes | sh racket-8.7-x86_64-linux-cs.sh
RUN raco setup --doc-index --force-user-docs

RUN raco pkg install --auto https://github.com/cpsc411/cpsc411-pub.git?path=cpsc411-lib#2022w2

ADD "https://api.github.com/repos/cpsc411/cpsc411-pub/commits/2022w2?per_page=1" latest_commit
RUN raco pkg update --auto cpsc411-lib

WORKDIR /app/workspace