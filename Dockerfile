FROM golang:alpine

WORKDIR /opt/terraform-provider-opsgenie

ADD . .

RUN go build -o ./bin/terraform-provider-opsgenie
