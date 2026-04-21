FROM archlinux:latest

RUN pacman -Syu --noconfirm \
    neovim git ripgrep fd \
    tree-sitter \
    nodejs npm python \
    base-devel make unzip \
    lua-language-server luarocks \
    python3

RUN npm install -g @anthropic-ai/claude-code

RUN useradd -m nvim
WORKDIR /home/nvim

USER nvim

COPY nvim/ /home//nvim/.config/nvim/

RUN nvim --headless "+Lazy! sync" +qa
