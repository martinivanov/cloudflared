FROM debian:stretch as builder

ADD "https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz" ./cloudflared-stable-linux-amd64.tgz
RUN tar zxvpf cloudflared-stable-linux-amd64.tgz

FROM gcr.io/distroless/base
COPY --from=builder ./cloudflared /usr/local/bin/
ENTRYPOINT ["cloudflared", "--no-autoupdate"]
