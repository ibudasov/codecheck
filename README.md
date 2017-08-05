# codecheck

Checks code in /src according to rules specified in /grumphp.yml

# @todo:

- check for input types of methods
- check for output types of methods
- check for returning optional values

# commands

- composer install
- vendor/bin/grumphp run
- docker build -t codecheck . && docker run -v /Users/igorbudasov/Projects/codecheck:/var/www/codecheck -it codecheck bash