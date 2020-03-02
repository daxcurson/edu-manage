package ar.com.strellis.edumanage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class EdumanageApplication {

	public static void main(String[] args) {
		SpringApplication.run(EdumanageApplication.class, args);
	}

}
