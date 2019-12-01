FROM alpine:3.9

EXPOSE 80
ENV MIX_ENV=prod \
  REPLACE_OS_VARS=true \
  SHELL=/bin/bash

RUN apk add --no-cache bash openssl

RUN mkdir -p /opt/app/ham_exam

WORKDIR /opt/app/ham_exam

COPY _build/prod/rel/hame_exam/ .

ENTRYPOINT ["/opt/app/ham_exam/bin/ham_exam"]
CMD ["foreground"]
