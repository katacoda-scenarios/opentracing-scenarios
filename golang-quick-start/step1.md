`docker run -d -p 5775:5775/udp -p 16686:16686 jaegertracing/all-in-one:latest`{{execute}}

https://[[HOST_SUBDOMAIN]]-16686-[[KATACODA_HOST]].environments.katacoda.com/


`
go get github.com/uber/jaeger && \
ln -s /gopath/src/github.com/uber/jaeger/examples/hotrod ~/tutorial/hotrod && \
curl -L https://gist.githubusercontent.com/BenHall/f42fc3c684895edf107a272f4a1df5f4/raw/2452cfa63908957b59dfeab44869b28489503103/frontend.go -o /gopath/src/github.com/uber/jaeger/examples/hotrod/cmd/frontend.go && \
curl -L https://gist.githubusercontent.com/BenHall/f42fc3c684895edf107a272f4a1df5f4/raw/2452cfa63908957b59dfeab44869b28489503103/init.go -o /gopath/src/github.com/uber/jaeger/examples/hotrod/pkg/tracing/init.go && \
cd /gopath/src/github.com/uber/jaeger && \
make install_examples && \
cd examples/hotrod && \
go run ./main.go all 
`{{execute}}

https://[[CLIENT_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
