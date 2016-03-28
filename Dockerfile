FROM alpine

MAINTAINER j842

RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN addgroup -S -g 12345 drgroup
RUN adduser -S -u 12345 -G drgroup -g '' druser

# add in the assets.
ADD ["./drunner","/drunner"]
RUN chmod a-w -R /drunner

# lock in druser.
USER druser
