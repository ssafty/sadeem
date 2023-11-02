FROM golang:1.21.3-alpine AS go_official_img

WORKDIR /app
COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN go build -o /sadeem

FROM scratch AS bin
COPY --from=go_official_img /sadeem .