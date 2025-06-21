# Use a lightweight Rust runtime for SpacetimeDB standalone
FROM debian:bookworm-slim

# 1. Install runtime dependencies
RUN apt-get update && \
    apt-get install -y ca-certificates curl && \
    rm -rf /var/lib/apt/lists/*

# 2. Download the SpacetimeDB standalone binary
#    (replace with the latest correct URL from releases)
RUN curl -L -o /usr/local/bin/spacetime \
      https://github.com/spacetime-db/spacetime/releases/download/v0.1.0/spacetime-standalone-linux && \
    chmod +x /usr/local/bin/spacetime

# 3. Expose the port SpacetimeDB serves on
EXPOSE 9000

# 4. Launch the database on all interfaces
ENTRYPOINT ["spacetime", "start", "-l", "0.0.0.0:9000"]
