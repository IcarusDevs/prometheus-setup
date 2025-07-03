FROM prom/prometheus:latest

# Copy configuration file
COPY prometheus.yml /etc/prometheus/prometheus.yml

# Expose Prometheus port
EXPOSE 9090

# Use the default entrypoint and command from the base image
# This will start Prometheus with the copied configuration
