##### Deploy release #######

FROM alpine:3.12 AS app

# Install app dependencies
RUN apk add --no-cache openssl ncurses-libs libical

EXPOSE 4000
ENV PORT=4000 \
  MIX_ENV=prod \
  SHELL=/bin/bash

# Copy app release from build state. See release name in mix.exs
WORKDIR /app
RUN chown nobody:nobody /app
USER nobody:nobody
COPY --chown=nobody:nobody countdownplus_app .

CMD ["bin/countdownplus_app", "start"]