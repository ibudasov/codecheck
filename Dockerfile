FROM thatsamguy/trusty-php71

RUN apt-get update
RUN aptitude install vim -y

# installing composer 
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN mv composer.phar /usr/local/bin/composer
RUN php -r "unlink('composer-setup.php');"

RUN echo "date.timezone = Europe/Prague" >> /etc/php.ini

# cloning the repo with dirty user hack
RUN adduser --disabled-password --gecos "" igor

# ast
RUN sudo apt-get install php7.1-dev
RUN sudo pecl channel-update pecl.php.net         
RUN sudo pecl install ast 
RUN sudo echo "extension=ast.so"  >> /etc/php/7.1/cli/php.ini

#codecheck
RUN mkdir /var/www/codecheck
RUN chmod 777 /var/www/codecheck
RUN su - igor -c 'git clone https://github.com/ibudasov/codecheck.git /var/www/codecheck'
RUN su - igor -c 'cd /var/www/codecheck && composer install'
