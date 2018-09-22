# Built following https://medium.com/@chemidy/create-the-smallest-and-secured-golang-docker-image-based-on-scratch-4752223b7324

# STEP 1 build executable binary
FROM golang:alpine as builder
# Install SSL ca certificates
RUN apk update && apk add git && apk add ca-certificates
# Create appuser
RUN adduser -D -g '' appuser
RUN git clone https://github.com/bitly/oauth2_proxy.git $GOPATH/src/mypackage/myapp/ 
WORKDIR $GOPATH/src/mypackage/myapp/

# Apply the self-signed cert patch
RUN wget https://github.com/vaLski/oauth2_proxy/commit/3899576c07a51cf94307d679c76aafd72dcba4f2.patch
RUN patch -p1 < 3899576c07a51cf94307d679c76aafd72dcba4f2.patch

#get dependencies
RUN go get -d -v
#build the binary
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/oauth_proxy


# STEP 2 build a small image
# start from scratch
FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
# Copy our static executable
COPY --from=builder /go/bin/oauth_proxy /go/bin/oauth_proxy

EXPOSE 4080
USER appuser
ENTRYPOINT ["/go/bin/oauth_proxy"]

