package com.kosta.bank.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.bank.bean.Account;

@Repository
public class AccountDAOImpl implements AccountDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//���°���
	@Override
	public void insertAccount(Account acc) throws Exception {
		sqlSession.insert("mapper.account.insertAccount", acc);
	}

	//�Ա�,���
	@Override
	public void updateBalance(Account acc) throws Exception {
		sqlSession.update("mapper.account.updateBalance", acc);
	}

	//������ȸ
	@Override
	public Account selectAccount(String id) throws Exception {
		return sqlSession.selectOne("mapper.account.selectAccount", id);
	}

	@Override
	public List<Account> selectAccountList() throws Exception {
		return sqlSession.selectList("mapper.account.selectAccountList");
	}


}
