

$ make bug 
```
docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine composer install

Installing dependencies from lock file (including require-dev)
[...]
docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine vendor/bin/phpstan.phar analyse -c phpstan-bug.neon
 2/2 [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] 100%

 ------ ------------------------------------------------------------------------------- 
  Line   SuperEnum.php                                                                  
 ------ ------------------------------------------------------------------------------- 
  12     Constant SuperEnum::DESCRIPTIONS is unused.                                    
         🪪  classConstant.unused                                                       
         💡 See: https://phpstan.org/developing-extensions/always-used-class-constants  
 ------ ------------------------------------------------------------------------------- 
                                                                                                                      
 [ERROR] Found 1 error                                                                                                
```                                                                                                                  


alborq@AQITO-ALLAN:/srv/zeturf/stan-reproducer$ make nobug 
```
docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine composer install
Installing dependencies from lock file (including require-dev)
[...]
docker run -it --rm -v ./:/app -w /app ghcr.io/devgine/composer-php:v2-php8.3-alpine vendor/bin/phpstan.phar analyse -c phpstan-nobug.neon
 3/3 [▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓] 100%
                                                                                                              
 [OK] No errors                                                                                                       
                                                                                                                      
```
