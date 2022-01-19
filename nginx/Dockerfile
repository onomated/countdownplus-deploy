FROM nginx

# Delete default welcome to nginx page
# RUN rm /usr/share/nginx/html/*

# Copy over the custom default configs
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.default
COPY configs/nginx.conf /etc/nginx/nginx.conf
COPY configs/default.conf /etc/nginx/conf.d/default.conf

# Create elasticbeanstalk log directories for health check.
# These must be accessible by nginx user on worker processes which are nginx:nginx
RUN mkdir -p /var/log/nginx/healthd
RUN chown -R nginx:nginx /var/log/nginx/healthd

# Start nginx in the foreground to play nicely with Docker
CMD ["nginx", "-g", "daemon off;"]