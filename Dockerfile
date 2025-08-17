# Stage 1 - Install ffmpeg
FROM debian:bullseye-slim AS ffmpeg-builder
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Stage 2 - n8n image with ffmpeg
FROM n8nio/n8n:latest

# Copy ffmpeg binary from builder stage
COPY --from=ffmpeg-builder /usr/bin/ffmpeg /usr/bin/ffmpeg
COPY --from=ffmpeg-builder /usr/bin/ffprobe /usr/bin/ffprobe

# Expose n8n port
EXPOSE 5678
