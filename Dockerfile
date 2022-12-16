FROM golang:1.19-alpine AS img

RUN mkdir -p /app
WORKDIR /app

ENV CGO_ENABLED=0

COPY . .

RUN go build ./app.go

FROM scratch
WORKDIR /app
COPY --from=img /app/app .
CMD ["/app/app"]