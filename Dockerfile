FROM alpine:3.18

RUN apk add --no-cache apache2 php8-apache2 php8 php8-mysqli php8-session php8-openssl php8-curl php8-json php8-mbstring php8-xml php8-zlib

RUN mkdir -p /run/apache2 &&     echo "ServerName localhost" >> /etc/apache2/httpd.conf &&     sed -i 's|^#LoadModule rewrite_module|LoadModule rewrite_module|' /etc/apache2/httpd.conf &&     sed -i 's|^DocumentRoot \".*\"|DocumentRoot \"/share/web\"|' /etc/apache2/httpd.conf &&     sed -i 's|^<Directory \".*\">|<Directory \"/share/web\">|' /etc/apache2/httpd.conf &&     sed -i 's|^#Include conf/extra/httpd-vhosts.conf|Include conf/extra/httpd-vhosts.conf|' /etc/apache2/httpd.conf

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
