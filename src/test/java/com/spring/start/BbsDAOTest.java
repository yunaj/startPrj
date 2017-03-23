package com.spring.start;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.spring.dao.BbsDAO;
import com.spring.vo.BbsVO;
import com.spring.vo.PageCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BbsDAOTest {
	@Inject
	BbsDAO bdao;
	
	private static Logger logger = LoggerFactory.getLogger(BbsDAOTest.class);
	
/*	@Test
	public void insertTest() throws Exception{
		BbsVO bvo = new BbsVO();
		
		bvo.setSubject("test subject");
		bvo.setContent("content");
		bvo.setWriter("mimi");
		
		bdao.insert(bvo);
	}
	
	@Test
	public void readTest() throws Exception{
		logger.info(bdao.read(1).toString());
	}
	
	@Test
	public void update() throws Exception{
		BbsVO bvo = new BbsVO();
		bvo.setBid(1);
		bvo.setSubject("수정제목");
		bvo.setContent("수정내용");
		bvo.setWriter("upmimi");
		bdao.update(bvo);
	}
	
	@Test
	public void delete() throws Exception{
		bdao.delete(162);
	}
	
	@Test
	public void listTest() throws Exception {
		logger.info(bdao.list().toString());
	}
	
	@Test
	public void listPageTest() throws Exception {
		int page = 5;
		
		List<BbsVO> list = bdao.listPage(page);
		
		for(BbsVO bbsVO : list) {
			logger.info(bbsVO.getBid() + " : " + bbsVO.getSubject());
		}
		
	}
	
	@Test
	public void listCriteriaTest() throws Exception {
		PageCriteria pageCriteria = new PageCriteria();
		pageCriteria.setPage(3);
		pageCriteria.setNumPerPage(15);
		
		List<BbsVO> list = bdao.listCriteria(pageCriteria);
		for(BbsVO bvo : list) {
			logger.info(bvo.getBid() + " : " + bvo.getSubject());
		}
	}
	
	
	//URIComponentsBuilder를 이용하는 법 : org.springframework.web.util에 있음
	@Test
	public void uriTestSample() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/bbs/read")
				.queryParam("bid", 100)
				.queryParam("numPerPage", 20)
				.build();
		
		logger.info("/bbs/read?bid=100&numPerPage=20");
		logger.info(uriComponents.toString());
	}
	
	@Test
	public void uriTest() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("bid", 100)
				.queryParam("numPerPage", 20)
				.build()
				.expand("bbs", "read")
				.encode();
		
		logger.info("/bbs/read?bid=100&numPerPage=20");
		logger.info(uriComponents.toString());
	}*/
	
	@Test
	public void searchTest() throws Exception {
		PageCriteria pc= new PageCriteria();
		
		pc.setPage(1);
		pc.setKeyword("15");
		pc.setSearchType("C");
		
		logger.info("*************테스트*************");
		
		List<BbsVO> list = bdao.list(pc);
		
		for(BbsVO bvo : list){
			logger.info(bvo.getBid() + " : " + bvo.getSubject());
		}
		
		logger.info("************테스트 데이터 개수************");
		logger.info("CountData : " + bdao.countData(pc));
	}

}
