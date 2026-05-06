FROM alpine:3.23.4 AS builder

ARG NVIM_COMMIT=4b35336f6f850ce68a230716401cdaa21bdb6a25

RUN apk add --no-cache \
  build-base \
  cmake \
  coreutils \
  curl \
  gettext-dev \
  libtool \
  ninja \
  pkgconf \
  unzip \
  zip \
  git \
  linux-headers

RUN git clone --depth 1 --revision=$NVIM_COMMIT https://github.com/neovim/neovim.git /tmp/neovim

WORKDIR /tmp/neovim

RUN make CMAKE_BUILD_TYPE=RelWithDebInfo install

FROM alpine:3.23.4

COPY --from=builder /usr/local /usr/local

RUN apk add --upgrade --no-cache \
  git \
  ripgrep \
  fd \
  unzip \
  nodejs \
  npm \
  python3 \
  tree-sitter \
  make \
  unzip \
  lua-language-server \
  luarocks \
  build-base \
  bash \
  libintl \
  wget

RUN npm install -g @anthropic-ai/claude-code
  
RUN adduser -D nvim
WORKDIR /home/nvim

COPY nvim/ /home/nvim/.config/nvim/

USER nvim

RUN nvim --headless "+Lazy! sync" +qa

CMD ["/bin/bash"]
