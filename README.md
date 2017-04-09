# docker-deployment-sandbox [![Build Status](https://travis-ci.org/lzakrzewski/docker-deployment-sandbox.svg?branch=master)](https://travis-ci.org/lzakrzewski/docker-deployment-sandbox)

This is an alternative way to deploy [simple-prepaid-card](https://github.com/lzakrzewski/simple-prepaid-card) repository.
Right now [docker-machine](https://docs.docker.com/machine/) was used for deployment purpose.


Deployed [simple-prepaid-card](https://github.com/lzakrzewski/simple-prepaid-card) app is available here: [http://104.131.96.133
](http://104.131.96.133) 

## Requirements
- [docker](https://docs.docker.com/)
- [docker-compose](https://docs.docker.com/compose/) min 1.10 
- [docker-machine](https://docs.docker.com/machine/)
- [make](https://www.gnu.org/software/make/manual/make.html)

## Usage
- Connect to your `docker-machine`
```bash
eval "$(docker-machine env simple-prepaid-card)"
```
- Deploy
```bash
make deploy
```

## Todo
- [ ] try with [kubernetes.io](https://kubernetes.io/)

