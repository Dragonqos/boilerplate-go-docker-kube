# Build
FROM --platform=$BUILDPLATFORM golang:1.17 AS BUILDER

ENV GOOS=linux
ENV GOTRACEBACK=single
ARG TARGETOS
ARG TARGETARCH
ARG SKAFFOLD_GO_GCFLAGS

WORKDIR /app
COPY . .

RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /service



# Make image
FROM scratch

ENV GOTRACEBACK=single
WORKDIR /

COPY --from=BUILDER /service /service
ENTRYPOINT ["/service"]
