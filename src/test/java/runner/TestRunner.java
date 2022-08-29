package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    public Karate runFeature() {
        return Karate.run("classpath:/features/XmlResponseMatcher.feature");
    }

    @Karate.Test
    public Karate runScenario() {
        return Karate.run("classpath:/features/XmlResponseMatcher.feature").tags("");
    }

}