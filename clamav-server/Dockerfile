FROM mkodockx/docker-clamav:latest

RUN sed -i '4iif [ -n "${HTTP_PROXY}" ];then echo -e "HTTPProxyServer ${HTTP_PROXY} \nHTTPProxyPort 3128" >> /etc/clamav/freshclam.conf; fi' /bootstrap.sh

