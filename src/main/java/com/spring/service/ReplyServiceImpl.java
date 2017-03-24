package com.spring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.dao.ReplyDAO;
import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public void write(ReplyVO rvo) throws Exception {
		dao.write(rvo);
	}

	@Override
	public void modify(ReplyVO rvo) throws Exception {
		dao.modify(rvo);
	}

	@Override
	public void delete(int rebid) throws Exception {
		dao.delete(rebid);
	}

	@Override
	public List<ReplyVO> list(int bid) throws Exception {
		return dao.list(bid);
	}

	@Override
	public List<ReplyVO> listPage(int bid, PageCriteria pageCriteria) throws Exception {
		return dao.listPage(bid, pageCriteria);
	}

	@Override
	public int countData(int bid) throws Exception {
		return dao.countData(bid);
	}

}
