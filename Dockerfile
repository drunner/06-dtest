FROM drunner/baseimage-alpine

USER druser

# add in the assets.
ADD ["./drunner","/drunner"]
