package com.spring.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.BbsVO;
import com.spring.vo.PageCriteria;

@Repository
public class BbsDAOImpl implements BbsDAO {
	private static final String NAMESPACE_PREFIX  = "com.spring.dao.BbsDAO.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insert(BbsVO bvo) throws Exception {
		sqlSession.insert(NAMESPACE_PREFIX + "insert", bvo);
	}

	@Override
	public BbsVO read(Integer bid) throws Exception {
		return sqlSession.selectOne(NAMESPACE_PREFIX + "read", bid);
	}

	@Override
	public void update(BbsVO bvo) throws Exception {
		sqlSession.update(NAMESPACE_PREFIX + "update", bvo);
	}

	@Override
	public void delete(Integer bid) throws Exception {
		sqlSession.delete(NAMESPACE_PREFIX + "delete", bid);
	}

	@Override
	public List<BbsVO> list(PageCriteria pageCriteria) throws Exception {
		return sqlSession.selectList(NAMESPACE_PREFIX + "list", pageCriteria);
	}

	@Override
	public int countData(PageCriteria pageCriteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE_PREFIX + "countData", pageCriteria);
	}

}
