FROM drunner/baseimage-alpine

# add in the assets.
ADD ["./drunner","/drunner"]
RUN chmod a-w -R /drunner

USER druser
