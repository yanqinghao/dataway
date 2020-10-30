package com.spproject.dataway;

import net.hasor.spring.boot.EnableHasor;
import net.hasor.spring.boot.EnableHasorWeb;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// 启用 Hasor
@EnableHasor()
@EnableHasorWeb()
@SpringBootApplication(scanBasePackages = { "config" })
public class DatawayApplication {

	public static void main(String[] args) {
		SpringApplication.run(DatawayApplication.class, args);
	}

}
