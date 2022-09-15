package com.spring_boot.FinalProject;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder(); //BcryptPasswordEncoder는 BCrypt라는 해시 함수를 이용하여 패스워드를 암호화하는 구현체
    }
	
	// 스프링 시큐리티 디폴트 로그인 폼 출력되지 않도록 설정
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.formLogin().disable()
			.headers().frameOptions().disable();
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.httpFirewall(defaultHttpFirewall());
	}
	
	@Bean
	public HttpFirewall defaultHttpFirewall() {
		return new DefaultHttpFirewall();
	}
}

// .csrf() : 사이트 간 요청 위조 (공격자가 위도하지 않는 요청을 수행하게 하는 취약점)