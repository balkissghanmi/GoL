FROM golang:1.22 

WORKDIR /app

COPY go.mod  .
COPY sum.go  .
RUN  go build -o sum .
ENTRYPOINT ["/app/sum"]