HotROD is a demo “ride sharing” application written in Golang.

## Download and Build

The command below downloads the example application, configuration and dependencies.

`
go get github.com/uber/jaeger && \
cd /gopath/src/github.com/uber/jaeger && \
make install && \
cd examples/hotrod && \
sed -i 's/127\.0\.0\.1/0.0.0.0/' cmd/frontend.go && \
sed -i 's/ReporterConfig{/ReporterConfig{LocalAgentHostPort: "docker:5775",/' pkg/tracing/init.go && \
go get 
`{{execute}}

## Run

Launch the application application with the command `go run ./main.go all`{{execute}}

The all command tells Go to run all the microservices as a single binary. The logs are written to standard out allowing you to see the microservices starting.
