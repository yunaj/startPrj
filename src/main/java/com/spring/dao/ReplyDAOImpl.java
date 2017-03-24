package com.spring.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.PageCriteria;
import com.spring.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	private static final String NAMESPACE_PREFIX  = "com.spring.dao.ReplyDAO.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> list(int bid) throws Exception {
		return sqlSession.selectList(NAMESPACE_PREFIX + "list", bid);
	}

	@Override
	public void write(ReplyVO rvo) throws Exception {
		sqlSession.insert(NAMESPACE_PREFIX + "write", rvo);
	}

	@Override
	public void modify(ReplyVO rvo) throws Exception {
		sqlSession.update(NAMESPACE_PREFIX + "modify", rvo);
	}

	@Override
	public void delete(int rebid) throws Exception {
		sqlSession.delete(NAMESPACE_PREFIX + "delete", rebid);
	}

	@Override
	public List<ReplyVO> listPage(int bid, PageCriteria pageCriteria) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		map.put("bid", bid);
		map.put("pageCriteria", pageCriteria);
		return sqlSession.selectList(NAMESPACE_PREFIX + "listPage", map);
	}

	@Override
	public int countData(int bid) throws Exception {
		return sqlSession.selectOne(NAMESPACE_PREFIX + "countData", bid);
	}

}
