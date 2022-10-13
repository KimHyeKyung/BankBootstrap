package com.kosta.bank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.bank.bean.Member;
import com.kosta.bank.dao.MemberDAO;

@Service
public class MemberService {

	@Autowired
	MemberDAO memberDAO;

	//ȸ������
	public void joinMember(Member member) throws Exception{
		Member emember = memberDAO.selectMember(member.getId());
		if(emember != null) throw new Exception("���¹�ȣ �ߺ�");
		memberDAO.join(member);
	}
	
	//��й�ȣ Ȯ��
	public boolean login(String id, String passoword) throws Exception{
		Member emember = memberDAO.selectMember(id);
		if(emember==null) throw new Exception("���̵� ����");
		if(!emember.getPassword().equals(passoword)) return false;
		
		return true;
	}
	
	//���̵� �ߺ�üũ
	public boolean isDoubleId(String id) throws Exception{
		Member emember = memberDAO.selectMember(id);
		if(emember==null) return false;
		return true;
	}

}
