FROM opensuse/leap:15.3

WORKDIR /app

# Due to Docker's caching model, only append RUNs to the end of this
# during "production".
# Minmizie RUNs before a new "release".

RUN zypper --non-interactive install nasm git-core binutils make gcc

RUN git clone --single-branch --depth 1 --branch v8.3 https://github.com/racket/racket
WORKDIR /app/racket
RUN make PKGS="base" PREFIX="/usr/" unix-style

RUN raco pkg install --auto compiler-lib plai-lib https://github.com/cpsc411/cpsc411-pub.git?path=cpsc411-lib#2021w2
ADD "https://api.github.com/repos/cpsc411/cpsc411-pub/commits/2021w2?per_page=1" latest_commit
RUN raco pkg update --auto cpsc411-lib

WORKDIR /app/workspace