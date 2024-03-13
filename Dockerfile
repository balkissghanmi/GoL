# syntax=docker/dockerfile:1

FROM golang:1.22

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod  ./
# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/reference/dockerfile/#copy
COPY *.go ./

# Build
RUN go build -o /docker-gs-ping
EXPOSE 8080

# Run
#CMD ["/docker-gs-ping"]