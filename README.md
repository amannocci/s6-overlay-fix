# S6-Overlay Fix [PR](https://github.com/just-containers/s6-overlay/pull/240)

# Steps
* Run `docker build -t test .` to build docker image
* Then run container with or without waiting services
  * `docker run -d --name test -e S6_SERVICES_GRACETIME=1 --cap-add SYS_PTRACE test`
  * or
  * `docker run -d --name test -e S6_SERVICES_GRACETIME=3000 --cap-add SYS_PTRACE test`
* Wait 5 seconds
* Stop container with `docker stop -t20 test`
* Look result `docker logs test`