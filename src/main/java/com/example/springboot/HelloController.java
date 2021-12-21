package com.example.springboot;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/")
	public String index(@RequestParam(required = false) String throwException) {
		if (throwException != null) {
			throw new RuntimeException(throwException);
		}
		return "Greetings from Spring Boot!";
	}

}
