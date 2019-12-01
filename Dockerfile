FROM elixir:1.9-alpine AS BOB_THE_BUILDER

ARG MIX_ENV=prod

ENV MIX_ENV=${MIX_ENV}

WORKDIR /opt/app/ham_exam

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache build-base git yarn

RUN mix local.rebar --force && \
    mix local.hex --force

COPY . .

RUN mix do deps.get --only prod, deps.compile, compile

WORKDIR /opt/app/ham_exam/assets
RUN yarn && yarn deploy

WORKDIR /opt/app/ham_exam
RUN mix phx.digest

RUN mkdir -p /opt/app/built && \
    MIX_ENV=prod mix distillery.release --env=prod && \
    cp _build/prod/rel/ham_exam/releases/0.1.0/ham_exam.tar.gz /opt/app/built

## Now, build the actual release image

FROM alpine:3.9

EXPOSE 4000
ENV PORT=4000 \
  MIX_ENV=prod \
  REPLACE_OS_VARS=true \
  SHELL=/bin/sh

RUN apk add --no-cache bash openssl

RUN mkdir -p /opt/app/ham_exam

WORKDIR /opt/app/ham_exam

COPY --from=BOB_THE_BUILDER /opt/app/built/ham_exam.tar.gz .

RUN tar -zxf ham_exam.tar.gz && \
    rm ham_exam.tar.gz

ENTRYPOINT ["/opt/app/ham_exam/bin/ham_exam"]
CMD ["foreground"]
