package com.spring.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	//private static final String namespace = "com.spring.dao.MemberDAO";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String getTime() {
		return sqlSession.selectOne("getTime");
		//return sqlSession.selectOne(namespace + ".getTime");
	}

	@Override
	public void insertMember(MemberVO memberVO) {
		 sqlSession.insert("insertMember", memberVO);
		 //sqlSession.insert(namespace + ".insertMember", memberVO);
		 
	}

}
