ARG VERSION=2

FROM caddy:${VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/desec \
    --with github.com/caddy-dns/duckdns \
    --with github.com/caddy-dns/namecheap \
    --with github.com/caddy-dns/porkbun \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/mholt/caddy-dynamicdns \
    --with github.com/dulli/caddy-wol \
    --with github.com/sjtug/caddy2-filter \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:${VERSION}

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
