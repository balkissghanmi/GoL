FROM golang:1.22-alpine as builder
WORKDIR /project/go-docker/
COPY go.* ./
RUN go mod download
COPY . .
RUN go build -o /project/go-docker/build/sum .

FROM alpine:latest
COPY --from=builder /project/go-docker/build/sum /project/go-docker/build/sum
EXPOSE 8081
ENTRYPOINT [ "/project/go-docker/build/sum" ]
