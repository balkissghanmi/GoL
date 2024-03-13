FROM golang:1.22
# Set destination for COPY
WORKDIR /app
# Download Go modules
COPY go.mod  ./
COPY *.go ./
# Build
RUN go build -o /docker-gs-ping
EXPOSE 8181

# Run
#CMD ["/docker-gs-ping"]