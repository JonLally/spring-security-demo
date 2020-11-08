package com.jonlally.spring.security.configuration;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EntityScan("com.jonlally.spring.security.entity")
@EnableJpaRepositories("com.jonlally.spring.security.repository")
public class DataRestConfiguration {
}
