We will be using an open source distributed tracing system Jaeger to collect and view the traces and analyze the application behavior. Jaeger, inspired by Dapper and OpenZipkin, is a distributed tracing system released as open source by Uber Technologies.

`docker run -d -p 5775:5775/udp -p 16686:16686 jaegertracing/all-in-one:latest`{{execute}}
