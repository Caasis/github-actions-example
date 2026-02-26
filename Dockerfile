FROM docker.io/busybox

COPY dist/* /var/www/

EXPOSE 8080
HEALTHCHECK CMD nc -zw 1 ::1 8080
# Workaround only for this image to prevent hang-up
STOPSIGNAL 9

CMD ["/bin/httpd", "-vvfp", "8080", "-h", "/var/www" ]
