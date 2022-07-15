# Build
FROM --platform=$BUILDPLATFORM golang:1.17-alpine AS BUILDER

ADD ../ /app
WORKDIR /app

ARG TARGETOS
ARG TARGETARCH

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -ldflags="-s -w" -o gosample ./main.go



# Make image
FROM scratch
COPY --from=BUILDER /app/gosample /
ENTRYPOINT ["/gosample"]
