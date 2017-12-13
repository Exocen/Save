#!/bin/bash

yaourt -Sy nginx-mainline certbot-nginx
sudo /bin/cp -f html2 /usr/share/nginx/html2
sudo mkdir -p /etc/nginx/sites-enabled/
sudo /bin/cp -f nginx.conf /etc/nginx/
sudo /bin/cp -f default /etc/nginx/sites-enabled/
sudo systemctl enable nginx
sudo systemctl start nginx
sudo certbot --nginx -n --agree-tos --rsa-key-size 4096 --register-unsafely-without-email -d exocen.com -d www.exocen.com
# auto certbot
sudo /bin/cp -f default_https /etc/nginx/sites-enabled/
sudo openssl dhparam -out /etc/nginx/dhparam.pem 4096 
sudo systemctl restart nginx
