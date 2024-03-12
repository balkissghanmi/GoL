FROM golang:1.22

WORKDIR /app

COPY go.mod  ./
COPY *.go ./


RUN CGO_ENABLED=0 GOOS=linux go build -o /dgoL

EXPOSE 8081
CMD ["/goL"]