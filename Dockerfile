FROM owncloud/base:xenial-20181008

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="ownCloud Server" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

ADD owncloud-*.tar.bz2 /var/www/
ADD richdocuments.tar.gz /var/www/owncloud/apps/

RUN mv /var/www/owncloud/apps/richdocuments-* /var/www/owncloud/apps/richdocuments

RUN find /var/www/owncloud \( \! -user www-data -o \! -group www-data \) -print0 | xargs -r -0 chown www-data:www-data
