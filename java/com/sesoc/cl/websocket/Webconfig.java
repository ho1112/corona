package com.sesoc.cl.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * 웹 소켓 설정 클래스 
 * @author LSY
 */
@Configuration
@EnableWebMvc
@EnableWebSocket
public class Webconfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer{
	
	/**
	 * 웹 소켓 접속 주소와 핸들러를 연결
	 */
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(teacherSideLessonHandler(), "/ws/teacherSideLesson");
		registry.addHandler(studentSideLessonHandler(), "/ws/studentSideLesson");
	}
	
	/**
	 * 선생님 접속용 웹 소켓 핸들러 객체 생성
	 * @return 선생님 접속용 웹 소켓 핸들러
	 */
	@Bean
	public WebSocketHandler teacherSideLessonHandler() {
		return new TeacherSideLessonWebSocketHandler();
	}
	
	/**
	 * 학생 접속용 웹 소켓 핸들러 객체 생성
	 * @return 학생 접속용 웹 소켓 핸들러
	 */
	@Bean
	public WebSocketHandler studentSideLessonHandler() {
		return new StudentSideLessonWebSocketHandler();
	}
	
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

}