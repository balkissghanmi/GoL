FROM golang:1.22

WORKDIR /app

COPY go.mod  ./
COPY *.go ./


RUN  go build -o /goL

EXPOSE 8081
CMD ["/goL"]