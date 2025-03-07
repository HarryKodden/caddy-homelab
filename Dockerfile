FROM caddy:2-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4 \
    --with github.com/abiosoft/caddy-yaml

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

# Expose standard ports
EXPOSE 80
EXPOSE 443