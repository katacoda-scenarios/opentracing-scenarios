HotROD is a demo “ride sharing” application written in Golang.

`docker run --rm -it \
  --link jaeger -p8080-8083:8080-8083 \
  jaegertracing/example-hotrod:latest \
  --jaeger-agent.host-port=jaeger:6831`{{execute}}
