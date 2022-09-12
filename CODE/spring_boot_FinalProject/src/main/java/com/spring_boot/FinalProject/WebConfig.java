package com.spring_boot.FinalProject;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/**")
        .addResourceLocations("file:///C:/springWorkspace/upload/");
		registry.addResourceHandler("/petImg/**")
        .addResourceLocations("file:///C:/springWorkspace/petImg/");
		registry.addResourceHandler("/profileImg/**")
        .addResourceLocations("file:///C:/springWorkspace/profileImg/");
		registry.addResourceHandler("/petHotelImg/**")
        .addResourceLocations("file:///C:/springWorkspace/petHotelImg/");
		registry.addResourceHandler("/comImg/**")
        .addResourceLocations("file:///C:/springWorkspace/comImg/");
	}
}
