package com.spring.start;


import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.dao.ReplyDAO;
import com.spring.vo.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDAOTest {
	@Inject
	private ReplyDAO rdao;
	
	private static Logger Logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Test
	public void writeTest() throws Exception {
		ReplyVO rvo = new ReplyVO();
		
		rvo.setBid(3);
		rvo.setReplyContent("댓글테스트");
		rvo.setReplyer("테스터");
		
		rdao.write(rvo);
		
		Logger.debug("d");
	}
}
