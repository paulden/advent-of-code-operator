#########################
###### Build Image ######
#########################

FROM elixir:1.14-alpine as builder

ENV MIX_ENV=prod \
  MIX_HOME=/opt/mix \
  HEX_HOME=/opt/hex

WORKDIR /app

COPY mix.lock mix.exs ./
COPY config config
COPY lib lib

RUN mix local.hex --force \
  && mix local.rebar --force \
  && mix deps.get \
  && mix release

#########################
##### Release Image #####
#########################

FROM elixir:1.14-alpine

# elixir expects utf8.
ENV MIX_ENV=prod \
 LANG=C.UTF-8

WORKDIR /app
COPY --from=builder /app/_build/prod/rel/advent_of_code ./
RUN chown -R nobody: /app

ENTRYPOINT ["/app/bin/advent_of_code"]
CMD ["start"]
