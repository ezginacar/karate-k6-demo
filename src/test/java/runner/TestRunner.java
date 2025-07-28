package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

class TestRunner {

    @Test
    void run() {
        Results results = Runner.path("classpath:features")
                .tags("@caseStudy")
                .parallel(1);


        Assertions.assertEquals(0, results.getFailCount());
    }
}