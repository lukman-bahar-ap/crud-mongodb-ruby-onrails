server {
    listen 8080;
    server_name example.com;

    # Tell Nginx and Passenger where your app's 'public' directory is
    root /home/app/blog-mongo.com/public;

    sendfile on;
    client_max_body_size 30M;

    # Prevent (deny) Access to Hidden Files with Nginx
    location ~ /\. {
        access_log off;
        log_not_found off; 
        deny all;
    }

    location = /robots.txt {
        allow all;
        log_not_found off;
        access_log off;
    }

    # set the expire date to max for assets
    location ~ "^/assets/(.*/)*.*-[0-9a-f]{32}.*" {
        gzip_static on;
        expires     max;
        add_header  Cache-Control public;
    }

    error_page  405     =200 $uri;

    location / {
        try_files /page_cache/$request_uri @passenger;
    }

    location @passenger {
        passenger_enabled on;
        passenger_user app;
        passenger_ruby /usr/bin/ruby3.0;
        passenger_app_env production;
        passenger_min_instances 100;
    }
}
