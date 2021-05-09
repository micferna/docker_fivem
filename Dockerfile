FROM alpine:latest

ARG USER=fivem

RUN apk add --no-cache --update sudo ca-certificates curl

RUN adduser -D $USER \
&& echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
&& chmod 0440 /etc/sudoers.d/$USER

WORKDIR fivem
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3922-d59ca5ee4232a9d636fd71e116f61960e974b29e/fx.tar.xz | tar xJ -C /fivem

USER fivem

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "/fivem/run.sh"]
CMD ["+exec", "/fivem/server.cfg"]
