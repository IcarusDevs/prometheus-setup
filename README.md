# Prometheus Setup

A simple Prometheus setup with Docker configuration for monitoring applications.

## Quick Start

### Using Docker Compose (Recommended)

```bash
# Clone the repository
git clone <your-repo-url>
cd prometheus-setup

# Start Prometheus
docker-compose up -d

# Access Prometheus UI
open http://localhost:9090
```

### Using Docker Build

```bash
# Build the image
docker build -t my-prometheus .

# Run the container
docker run -d \
  --name prometheus \
  -p 9090:9090 \
  -v prometheus-data:/prometheus \
  my-prometheus
```

## Configuration

### Adding New Targets

Edit `prometheus.yml` to add your application endpoints:

```yaml
scrape_configs:
  - job_name: 'my-app'
    static_configs:
      - targets: ['your-app:port']
    metrics_path: /metrics
```

### Reloading Configuration

Prometheus supports hot reloading:

```bash
# Send reload signal
curl -X POST http://localhost:9090/-/reload
```

## Accessing Prometheus

- **Web UI**: http://localhost:9090
- **Metrics API**: http://localhost:9090/api/v1/
- **Health Check**: http://localhost:9090/-/healthy

## Common Queries

```promql
# HTTP request rate
rate(http_requests_total[5m])

# Memory usage
process_resident_memory_bytes

# CPU usage
rate(process_cpu_seconds_total[5m])
```

## Integration with .NET Applications

Your .NET app should expose metrics at `/metrics` endpoint. Install:

```bash
dotnet add package prometheus-net.AspNetCore
```

Add to your `Program.cs`:

```csharp
app.UseMetricServer(); // Exposes /metrics
app.UseHttpMetrics();  // Collects HTTP metrics
```

## Troubleshooting

### Check if targets are up
1. Go to http://localhost:9090/targets
2. Verify all targets show as "UP"

### View configuration
- Current config: http://localhost:9090/config
- Reload config: `curl -X POST http://localhost:9090/-/reload`

### Logs
```bash
docker logs prometheus
```
