# Dockerfile
FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update; apt-get install -y wget && \
    echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' > /etc/apt/sources.list.d/newrelic.list && \
    wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add - &&  \
    apt-get update; apt-get install  -y newrelic-sysmond

CMD /usr/sbin/nrsysmond-config --set license_key=${NEW_RELIC_LICENSE_KEY} ; /usr/sbin/nrsysmond -F -n ${HOSTNAME} -c /etc/newrelic/nrsysmond.cfg  -l /dev/stdout
