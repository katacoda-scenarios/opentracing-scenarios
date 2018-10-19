git clone https://github.com/yurishkuro/opentracing-tutorial \
  && docker run -d \
    -p16686:16686 \
    -p14268:14268 \
    jaegertracing/all-in-one:1.7 \
    --log-level=debug
