# Use the official Golang image to create a build artifact.
FROM golang:1.26-alpine AS builder

# Set the working directory inside the container.
WORKDIR /app

# Copy go mod and sum files.
COPY go.mod go.sum ./

# Download all dependencies.
RUN go mod download

# Copy the source from the current directory to the working directory inside the container.
COPY . .

# Build the Go app.
RUN go build -o main .

# Start a new stage from scratch.
FROM alpine:latest

WORKDIR /root/

# Copy the Pre-built binary file from the previous stage.
COPY --from=builder /app/main .
COPY --from=builder /app/views ./views
COPY --from=builder /app/public ./public

# Expose port 3000 to the outside world.
EXPOSE 3000

# Command to run the executable.
CMD ["./main"]
