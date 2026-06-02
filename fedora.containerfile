FROM fedora:latest

COPY install_fedora.sh /install_fedora.sh
RUN --mount=type=cache,target=/var/cache/dnf \
    --mount=type=cache,target=/var/lib/dnf \
    sh /install_fedora.sh

COPY scripts /rdkr/terminal/scripts
COPY antidote_plugins.txt /rdkr/terminal/antidote_plugins.txt
RUN echo 'export TERMINAL_DIR=/rdkr/terminal' >> ~/.zshrc
RUN echo 'source $TERMINAL_DIR/scripts/main.sh' >> ~/.zshrc
RUN zsh -c 'source ~/.zshrc'

ENV CARGO_TARGET_DIR=/tmp/cargo-install-target
COPY install_rust.sh /install_rust.sh
RUN --mount=type=cache,target=/root/.cargo/registry \
    --mount=type=cache,target=/root/.cargo/git \
    --mount=type=cache,target=/root/.rustup \
    --mount=type=cache,target=/tmp/cargo-install-target \
    zsh -c 'source ~/.zshrc && sh /install_rust.sh' && \
    cp -r /tmp/cargo-install-target/release/atuin* ~/.cargo/bin/ && \
    cp -r /tmp/cargo-install-target/release/cargo-install-update* ~/.cargo/bin/

COPY config /rdkr/terminal/config

RUN zsh ~/.zshrc
RUN zsh -c 'source ~/.zshrc && atuin --version && cargo-install-update --version'
