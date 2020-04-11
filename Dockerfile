FROM alpine:latest

RUN apk add --no-cache ca-certificates curl

RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/1971-fbd5c11df14693e9be8a9b86b02689abfc790f69/fx.tar.xz | tar xJ -C /srv

WORKDIR /srv

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "/srv/run.sh"]
CMD ["+exec", "/srv/server.cfg"]
