FROM sumankhanal/rakurstudio
ENV RUSTUP_HOME=/usr/local/rustup \
    CARGO_HOME=/usr/local/cargo \
RUST_VERSION=1.43.1

LABEL maintainer="Dr Suman Khanal <suman81765@gmail.com>"

RUN set -eux; \
\
url="https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init"; \
wget "$url"; \
chmod +x rustup-init; \
./rustup-init -y --no-modify-path --default-toolchain $RUST_VERSION; \
rm rustup-init; \
chmod -R a+w $RUSTUP_HOME $CARGO_HOME; \
echo "RUSTUP_HOME=/usr/local/rustup" >> /usr/local/lib/R/etc/Renviron; \
ln -s /usr/local/cargo/bin/* /usr/local/bin;
