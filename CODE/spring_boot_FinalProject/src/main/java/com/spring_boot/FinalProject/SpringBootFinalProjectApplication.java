package com.spring_boot.FinalProject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.spring_boot.FinalProject"})
@MapperScan(basePackages = {"com.spring_boot.FinalProject"})
public class SpringBootFinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootFinalProjectApplication.class, args);
	}

}
