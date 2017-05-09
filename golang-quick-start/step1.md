`docker run -d -p 5775:5775/udp -p 16686:16686 jaegertracing/all-in-one:latest`{{execute}}

https://[[HOST_SUBDOMAIN]]-16686-[[KATACODA_HOST]].environments.katacoda.com/


`
go get github.com/uber/jaeger && \
cd $GOPATH/src/github.com/uber/jaeger && \
make install_examples && \
cd examples/hotrod && \
go run ./main.go all 
`{{execute}}

https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
