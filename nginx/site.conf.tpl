server {
    listen [::]:80;
    listen 80;
    server_name ${domain} www.${domain};

    server_name _;
    server_tokens off;

    location /.well-known/acme-challenge/ {
        root /var/www/certbot/${domain};
    }

    location / {
        return 301 https://$host$request_uri;
    }
}

server {
    listen [::]:443 ssl http2;
    listen 443 ssl http2;
    server_name ${domain} www.${domain};

    server_name _;
    server_tokens off;

    ssl_certificate /etc/nginx/sites/ssl/dummy/${domain}/fullchain.pem;
    ssl_certificate_key /etc/nginx/sites/ssl/dummy/${domain}/privkey.pem;

    include /etc/nginx/includes/options-ssl-nginx.conf;

    # RFC-7919 recommended: https://wiki.mozilla.org/Security/Server_Side_TLS#ffdhe4096
    ssl_dhparam /etc/ssl/ffdhe4096.pem;

    ssl_dhparam /etc/nginx/sites/ssl/ssl-dhparams.pem;

    include /etc/nginx/includes/hsts.conf;

    include /etc/nginx/vhosts/${domain}.conf;
}
