# Build
FROM --platform=$BUILDPLATFORM golang:1.17 AS BUILDER

ADD . /app
WORKDIR /app

ENV GOOS=linux
ENV GOTRACEBACK=single
ARG TARGETOS
ARG TARGETARCH
ARG SKAFFOLD_GO_GCFLAGS

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go mod tidy && go build -ldflags="-s -w" -gcflags="${SKAFFOLD_GO_GCFLAGS}" -o service1 ./main.go



# Make image
FROM scratch
COPY --from=BUILDER /app/service1 /
ENV GOTRACEBACK=single
ENTRYPOINT ["/service1"]
