FROM mkodockx/docker-clamav:latest

RUN echo "HTTPProxyServer pxdev.nexxera.com" >> /etc/clamav/freshclam.conf && \
    echo "HTTPProxyPort 3128" >> /etc/clamav/freshclam.conf
