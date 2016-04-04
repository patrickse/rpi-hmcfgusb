# HMCFGUSB

Dockerized version of HMCFGUSB. Take a look at http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb.

# Build

```
# Build version 0.102
docker build -t patrickse/rpi-hmcfgusb:0.102 .

# Build other version 
docker build --build-arg HMCFGUSB_VERSION=0.101 -t patrickse/rpi-hmcfgusb:0.101 .
```

# Run

```
# Run together with links and homegear
docker run --name hmland -d patrickse/rpi-hmcfgusb:0.102
docker run --link hmland:hmland -d homegear/homegear-0.5
```
