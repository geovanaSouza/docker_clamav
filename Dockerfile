FROM mkodockx/docker-clamav:latest

RUN sed -i '4iecho -e "HTTPProxyServer ${HTTP_PROXY} \nHTTPProxyPort 3128" >> /etc/clamav/freshclam.conf' /bootstrap.sh
