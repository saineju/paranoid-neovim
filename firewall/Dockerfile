FROM alpine:3.23.4

RUN apk add --no-cache --upgrade iproute2 \
  nftables \
  squid \
  grep \
  bind-tools

CMD ["bin/sh", "/start.sh"]
