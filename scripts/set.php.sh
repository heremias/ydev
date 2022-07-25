cd /usr/local/etc/php
sed -ri -e 's!128M!512M!g' php.ini-production
sed -ri -e 's!128M!512M!g' php.ini-development
cp php.ini-production php.ini