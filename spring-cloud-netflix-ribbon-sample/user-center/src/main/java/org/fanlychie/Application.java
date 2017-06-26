package org.fanlychie;

import org.fanlychie.config.RibbonConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

/**
 * Created by fanlychie on 2017/6/20.
 */
@SpringBootApplication
@RibbonClient(name = "order-service", configuration = RibbonConfiguration.class)
public class Application {

    @Bean
    @LoadBalanced
    public RestTemplate proviceRestTemplate() {
        return new RestTemplate();
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class);
    }

}