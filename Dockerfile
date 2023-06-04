FROM ghcr.io/abotalebie/laravel-php-8.1

LABEL authors="Mostafa Aboutalebi"

RUN apt-get update && apt-get -y install cron

COPY laravel /etc/cron.d/laravel

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/laravel

# Apply cron job
RUN crontab /etc/cron.d/laravel

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log