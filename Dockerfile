FROM debian:jessie
MAINTAINER hervenicol

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update  \
 && apt-get install -y php5-fpm php5-mysql php5-curl && apt-get clean

# Updates to config file:
## Set listen port to 9000
## Redirect output to stdout
## Keep env vars
RUN sed -e 's/listen = .*/listen = 9000/' \
        -e '/catch_workers_output/s/^;//' \
        -e 's/www-data/root/g' \
        -e '/clear_env/s/^;//' \
        -i /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000

LABEL description="Jessie / php5 FPM"

CMD ["/usr/sbin/php5-fpm", "--nodaemonize", "--force-stderr", "--allow-to-run-as-root"]

