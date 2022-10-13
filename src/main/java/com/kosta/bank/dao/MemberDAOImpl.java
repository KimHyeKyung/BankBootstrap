package com.kosta.bank.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.bank.bean.Member;

@Repository
public class MemberDAOImpl  implements MemberDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//회원가입 수행
	@Override
	public void join(Member member) throws Exception {
		sqlSession.insert("mapper.member.join", member);
		
	}

	//로그인 수행
	@Override
	public Member login(Member member) throws Exception {
		return sqlSession.selectOne("mapper.member.login", member);
	}

	@Override
	public Member selectMember(String id) throws Exception {
		return sqlSession.selectOne("mapper.member.selectMember", id);
	}

}
