FROM prom/prometheus:latest

# Expose Prometheus port
EXPOSE 9090

# Use the default entrypoint and command from the base image
# This will start Prometheus with the mounted configuration
