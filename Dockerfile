# Stage 1: Build the application
FROM golang:1.26-alpine AS builder

# Install build dependencies: git and gcc/musl-dev for CGO (required by go-sqlite3)
RUN apk add --no-cache git gcc musl-dev

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files first for better layer caching
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the source code
COPY . .

# Build the application
# CGO_ENABLED=1 is required for go-sqlite3
RUN CGO_ENABLED=1 GOOS=linux go build -o magic8 main.go

# Stage 2: Run the application
FROM alpine:latest

# Install ca-certificates and timezone data
RUN apk add --no-cache ca-certificates tzdata

WORKDIR /root/

# Copy the binary from the builder stage
COPY --from=builder /app/magic8 .

# Copy runtime assets required by the application
# Based on your main.go, these are necessary:
COPY --from=builder /app/views ./views
COPY --from=builder /app/public ./public

# Expose the port the app listens on (from app.Listen(":3000"))
EXPOSE 3000

# Run the binary
CMD ["./magic8"]
