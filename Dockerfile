FROM debian:bullseye-slim
LABEL maintainer=austozi
RUN apt-get -q update
RUN apt-get -y install fdroidserver apache2
RUN mkdir -p /var/www/html/fdroid/repo
WORKDIR /var/www/html/fdroid
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
