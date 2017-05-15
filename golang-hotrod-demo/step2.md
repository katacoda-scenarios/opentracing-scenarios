HotROD is a demo “ride sharing” application written in Golang.

## Download and Build

`
go get github.com/uber/jaeger && \
ln -s /gopath/src/github.com/uber/jaeger/examples/hotrod ~/tutorial/hotrod && \
curl -sSL https://gist.githubusercontent.com/BenHall/f42fc3c684895edf107a272f4a1df5f4/raw/2452cfa63908957b59dfeab44869b28489503103/frontend.go -o /gopath/src/github.com/uber/jaeger/examples/hotrod/cmd/frontend.go && \
curl -sSL https://gist.githubusercontent.com/BenHall/f42fc3c684895edf107a272f4a1df5f4/raw/2452cfa63908957b59dfeab44869b28489503103/init.go -o /gopath/src/github.com/uber/jaeger/examples/hotrod/pkg/tracing/init.go && \
cd /gopath/src/github.com/uber/jaeger && \
make install_examples && \
cd examples/hotrod
`{{execute}}

## Run

`go run ./main.go all`{{execute}}

The all command tells it to run all microservices from a single binary. In the logs written to standard out we can see these microservices starting.
