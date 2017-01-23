package com.spring.start;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //스프링 MVC테스트 하기 위해서 필요한 어노테이션
@ContextConfiguration(locations={"file:/src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ControllerTest {
	private static final Logger logger = LoggerFactory.getLogger(ControllerTest.class);
	
	@Inject
	private WebApplicationContext webAppCtx;
	
	private MockMvc mocMvc; //브라우저에서 요청과 응답을 하는 객체를 의미
	
	@Before
	public void setup(){
		this.mocMvc = MockMvcBuilders.webAppContextSetup(this.webAppCtx).build();
		logger.info("setup() 호출...");
	}
	
	@Test
	public void testController() throws Exception {
		mocMvc.perform(MockMvcRequestBuilders.get("/controller")); //post 방식도 가능
	}
}
