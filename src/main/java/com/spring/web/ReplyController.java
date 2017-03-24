package com.spring.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring.service.ReplyService;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;
import com.spring.vo.ReplyVO;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	
	@Inject
	private ReplyService rsvc;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReplyVO rvo) { //ResponseEntity는 http status(404, 500등)를 반환, requestBody어노테이션은 전송된 데이터를 객체로 변환시켜줌(modelattribute와 비슷. JSON을 사용하는 점이 차이)
		 ResponseEntity<String> resEntity = null;
		 
		 try {
			rsvc.write(rvo);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		 } catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		 }
		 
		 return resEntity;
	}
	
	@RequestMapping(value="/list/{bid}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bid") int bid){
		ResponseEntity<List<ReplyVO>> resEntity = null;
		
		try {
			resEntity = new ResponseEntity<List<ReplyVO>>(rsvc.list(bid), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}
	
	@RequestMapping(value="/{rebid}", method={RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("rebid") int rebid, @RequestBody ReplyVO rvo) { 
		 ResponseEntity<String> resEntity = null;
		 
		 try {
			rvo.setRebid(rebid);
			rsvc.modify(rvo);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		 } catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		 }
		 
		 return resEntity;
	}
	
	@RequestMapping(value="/{rebid}", method=RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("rebid") int rebid) {
		 ResponseEntity<String> resEntity = null;
		 
		 try {
			rsvc.delete(rebid);
			resEntity = new ResponseEntity<String>("Success", HttpStatus.OK);
		 } catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		 }
		 
		 return resEntity;
	}
	
	@RequestMapping(value="/{bid}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("bid") int bid,
													@PathVariable("page") int page){
		ResponseEntity<Map<String, Object>> resEntity = null;
		
		try {
			PageCriteria pageCriteria = new PageCriteria();
			pageCriteria.setPage(page);
			
			PagingMaker pagingMaker = new PagingMaker();
			pagingMaker.setPageCriteria(pageCriteria);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = rsvc.listPage(bid, pageCriteria);			
			map.put("list", list);
			
			int countData = rsvc.countData(bid);
			pagingMaker.setTotalData(countData);
			map.put("pagingMaker", pagingMaker);
			
			resEntity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			resEntity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return resEntity;
	}
}
