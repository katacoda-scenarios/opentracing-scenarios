Let's create an instance of a real tracer, such as Jaeger (http://github.com/uber/jaeger-client-java). Our `pom.xml` already imports Jaeger:

```xml
<dependency>
    <groupId>io.jaegertracing</groupId>
    <artifactId>jaeger-client</artifactId>
    <version>0.32.0</version>
</dependency>
```

We need to add some imports:

<pre class="file" data-target="clipboard">
import io.jaegertracing.Configuration;
import io.jaegertracing.Configuration.ReporterConfiguration;
import io.jaegertracing.Configuration.SamplerConfiguration;
import io.jaegertracing.internal.JaegerTracer;
</pre>

And we define a helper function that will create a tracer.

<pre class="file" data-target="clipboard">
public static JaegerTracer initTracer(String service) {
    SamplerConfiguration samplerConfig = new SamplerConfiguration().fromEnv().withType("const").withParam(1);
    ReporterConfiguration reporterConfig = new ReporterConfiguration().fromEnv().withLogSpans(true);
    Configuration config = new Configuration(service).withSampler(samplerConfig).withReporter(reporterConfig);
    return config.getTracer();
}
</pre>

To use this instance, let's change the main function:

<pre class="file" data-target="clipboard">
Tracer tracer = initTracer("hello-world");
new Hello(tracer).sayHello(helloTo);
</pre>

Note that we are passing a string `hello-world` to the init method. It is used to mark all spans emitted by the tracer as originating from a `hello-world` service.

This is how our `Hello` class looks like now:

<pre class="file" data-filename="java/src/main/java/lesson01/exercise/Hello.java" data-target="replace">package lesson01.exercise;

import io.opentracing.Span;
import io.opentracing.Tracer;
import io.opentracing.util.GlobalTracer;

import io.jaegertracing.Configuration;
import io.jaegertracing.Configuration.ReporterConfiguration;
import io.jaegertracing.Configuration.SamplerConfiguration;
import io.jaegertracing.internal.JaegerTracer;

public class Hello {

    private final Tracer tracer;

    private Hello(Tracer tracer) {
        this.tracer = tracer;
    }

    private void sayHello(String helloTo) {
        Span span = tracer.buildSpan("say-hello").start();

        String helloStr = String.format("Hello, %s!", helloTo);
        System.out.println(helloStr);

        span.finish();
    }

    public static void main(String[] args) {
        if (args.length != 1) {
            throw new IllegalArgumentException("Expecting one argument");
        }
        String helloTo = args[0];
        Tracer tracer = initTracer("hello-world");
        new Hello(tracer).sayHello(helloTo);
    }

    public static JaegerTracer initTracer(String service) {
        SamplerConfiguration samplerConfig = new SamplerConfiguration().fromEnv().withType("const").withParam(1);
        ReporterConfiguration reporterConfig = new ReporterConfiguration().fromEnv().withLogSpans(true);
        Configuration config = new Configuration(service).withSampler(samplerConfig).withReporter(reporterConfig);
        return config.getTracer();
    }

}</pre>

NOTE: as this scenario runs on Docker, we need to specify the Agent's hostname to the Jaeger client. We can do that by setting this: `export JAEGER_ENDPOINT=http://host01:14268/api/traces`{{execute}}.

Running the program now, we see a span logged. Try it out: `./run.sh lesson01.exercise.Hello Bryan`{{execute}}.

Check also the [Jaeger UI](https://[[HOST_SUBDOMAIN]]-16686-[[KATACODA_HOST]].environments.katacoda.com/search?service=hello-world) for the newly created trace!
