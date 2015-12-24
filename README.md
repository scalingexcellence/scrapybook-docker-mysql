# scrapybook-docker-redis

This is a very minimal mysql container. The only thing I changed on the default ubuntu config was setting

```
bind-address		= 0.0.0.0
```

Heavily inspired by:

* https://github.com/fideloper/docker-mysql
* https://github.com/docker-library/mysql/blob/master/5.5/docker-entrypoint.sh

Had a look at:

* http://workshop.botter.ventures/2014/02/09/how-to-install-and-optimize-mysql-on-raspberry-pi/
* http://www.tocker.ca/2014/03/10/configuring-mysql-to-use-minimal-memory.html
