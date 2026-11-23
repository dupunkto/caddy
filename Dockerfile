# check=skip=InvalidDefaultArgInFrom

ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder AS build

ARG CADDY_VERSION
ARG PLUGINS

RUN xcaddy build "v$CADDY_VERSION" --output /usr/bin/caddy $PLUGINS

FROM caddy:${CADDY_VERSION}

COPY --from=build /usr/bin/caddy /usr/bin/caddy

COPY Caddyfile /etc/caddy/Caddyfile
