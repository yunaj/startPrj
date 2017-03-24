package com.spring.service;

import java.util.List;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

public interface ReplyService {
	public void write(ReplyVO rvo) throws Exception;
	public void modify(ReplyVO rvo) throws Exception;
	public void delete(int rebid) throws Exception;
	public List<ReplyVO> list(int bid) throws Exception;
	public List<ReplyVO> listPage(int bid, PageCriteria pageCriteria) throws Exception;
	public int countData(int bid) throws Exception;
}
