<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @EnableWebSecurity
    public static class SecurityConfig extends WebSecurityConfigurerAdapter {

        @Override
        protected void configure(HttpSecurity http) throws Exception {
            http
                .authorizeRequests()
                    .antMatchers("/", "/home").permitAll()  // 누구나 접근 가능한 페이지
                    .anyRequest().authenticated()          // 나머지 요청은 인증 필요
                .and()
                .formLogin()
                    .loginPage("/login")  // 로그인 페이지 경로
                    .permitAll()           // 로그인 페이지는 누구나 접근 가능
                    .defaultSuccessUrl("/home", true)  // 로그인 성공 후 리다이렉트
                .and()
                .logout()
                    .permitAll();  // 로그아웃은 누구나 접근 가능
        }

        @Bean
        public UserDetailsService userDetailsService() {
            UserDetails user = User
                .withUsername("user")
                .password("{noop}password")  // 비밀번호는 {noop}을 사용하여 암호화하지 않음
                .roles("USER")
                .build();

            UserDetails admin = User
                .withUsername("admin")
                .password("{noop}admin")
                .roles("ADMIN")
                .build();

            return new InMemoryUserDetailsManager(user, admin);
        }
    }

    @RestController
    public static class HomeController {

        @GetMapping("/login")
        public String login() {
            return "<html><body><h2>Login</h2>" +
                   "<form action='/login' method='post'>" +
                   "Username: <input type='text' name='username'><br>" +
                   "Password: <input type='password' name='password'><br>" +
                   "<button type='submit'>Login</button>" +
                   "</form></body></html>";
        }

        @GetMapping("/home")
        public String home() {
            return "<html><body><h2>Welcome to the Home Page!</h2>" +
                   "<p><a href='/logout'>Logout</a></p></body></html>";
        }
    }
}
