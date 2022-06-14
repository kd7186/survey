package com.lsurvey.example.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	   
	   @Autowired
	   private DataSource dataSource;
	   
	   @Bean
	   public PasswordEncoder passwordEncoder() {
	      return new BCryptPasswordEncoder();
	   }
	   
	   
	   @Override
	   protected void configure(HttpSecurity http) throws Exception {

	      http
	      .authorizeRequests()
	            .antMatchers("/user/**").authenticated()
	            .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
	            .anyRequest().permitAll()
	            .and()
	      .formLogin()
	            .loginPage("/login")
	            .loginProcessingUrl("/loginPro")
	            .defaultSuccessUrl("/", true)
	            .permitAll()
	            .and()
	      .logout()
	         .logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	         .logoutSuccessUrl("/")
	         .invalidateHttpSession(true)
	         .deleteCookies("JSESSIONID", "remember-me")
	         .and()
	      .rememberMe()
	         .key("myWeb")
	         .rememberMeParameter("remember-me")
	         .tokenValiditySeconds(86400)
	         .and()
	      .exceptionHandling()
	         .accessDeniedPage("/denied")
	         .and()
	      .sessionManagement()
	         .sessionCreationPolicy(SessionCreationPolicy.NEVER)   
	         .invalidSessionUrl("/login")
	         .and()
	      .csrf().disable();       
	   }
	   @Bean
	   public PersistentTokenRepository persistentTokenRepository() {
	      JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl();
	      db.setDataSource(dataSource);
	      return db;
	   }

}

