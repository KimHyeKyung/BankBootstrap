package com.kosta.bank.dao;

import com.kosta.bank.bean.Member;

//�������̽��� �⺻�� public
public interface MemberDAO {
	
	//ȸ������ ����
	void join(Member member) throws Exception;

	//�α��� ����
	Member login(Member member) throws Exception;

	Member selectMember(String id) throws Exception;

	
}
