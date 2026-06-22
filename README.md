# Magic 8 Ball

A fun, interactive Magic 8 Ball web application built with Go and the Fiber web framework. This application simulates the classic Magic 8 Ball experience with a pool table theme, featuring a "felt green" background and pool bumpers.

## Features

- **Interactive Animation**: The ball rolls around the screen and hits pool bumpers before revealing the answer.
- **Backend-Driven Logic**: Movement paths and bumper hits are calculated on the server.
- **Classic Responses**: Includes all 20 traditional Magic 8 Ball messages.
- **Modern Tech Stack**: Built with Go 1.26, Fiber, and SVG animations.

## Getting Started

The application is containerized and available at `quay.io/cmbsolver/magic8`. It listens on port `3000`.

### Using Docker

To spin up the application using Docker, run:

```bash
docker run -d -p 3000:3000 --name magic8 quay.io/cmbsolver/magic8
```

You can then access the application at `http://127.0.0.1:3000`.

### Using Podman

To spin up the application using Podman, run:

```bash
podman run -d -p 3000:3000 --name magic8 quay.io/cmbsolver/magic8
```

You can then access the application at `http://127.0.0.1:3000`.

## Development

To run the application locally (requires Go 1.26+):

```bash
go run main.go
```
