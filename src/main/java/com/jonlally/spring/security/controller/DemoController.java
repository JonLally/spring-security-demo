package com.jonlally.spring.security.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/demo")
public class DemoController {

  @GetMapping
  public String demo() {
    return "This is a demo test";
  }

  @PostMapping
  public ResponseEntity<?> create() {
    return ResponseEntity.ok().build();
  }
}
