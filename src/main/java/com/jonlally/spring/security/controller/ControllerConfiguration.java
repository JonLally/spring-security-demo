package com.jonlally.spring.security.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(DemoController.class)
public class ControllerConfiguration {
}
