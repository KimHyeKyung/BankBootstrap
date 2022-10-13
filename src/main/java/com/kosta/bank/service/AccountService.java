package com.kosta.bank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.bank.bean.Account;
import com.kosta.bank.dao.AccountDAO;
import com.kosta.bank.exception.BankException;
import com.kosta.bank.exception.ERR;

@Service
public class AccountService {
	
	@Autowired
	AccountDAO accountDAO;
	
	//계좌개설
	public void makeAccount(Account acc) throws Exception{
		Account racc = accountDAO.selectAccount(acc.getId());
		if(racc != null) throw new BankException(ERR.EXIST_ACCNUM);
		accountDAO.insertAccount(acc);
	}

	//계좌조회
	public Account selectAccount(String id) throws Exception{
		Account acc = accountDAO.selectAccount(id);
		if(acc==null) throw new BankException(ERR.NOT_ACCNUM);
		return acc;
	}
	
	//계좌번호 중복체크
	public boolean isDoubleAccountId(String id) throws Exception{
		Account account = accountDAO.selectAccount(id);
		if(account==null) return false;
		return true;
	}
	
	//입금,출금
	public void updateBalance(Account acc) throws Exception{
		Account racc = accountDAO.selectAccount(acc.getId());
		if(racc == null) throw new BankException(ERR.NOT_ACCNUM);
		accountDAO.updateBalance(acc);
	}

	//전체계좌조회
	public List<Account> selectAccountList() throws Exception {
		return accountDAO.selectAccountList();
	}
	
	//입금
	public void deposit(String id, int money) throws Exception{
		Account acc = selectAccount(id);
		acc.deposit(money);
		if(acc == null) throw new BankException(ERR.NOT_ACCNUM);
		accountDAO.updateBalance(acc);
	}
	
	//출금
	public void withdraw(String id, int money) throws Exception{
		Account acc = selectAccount(id);
		acc.withdraw(money);
		if(acc == null) throw new BankException(ERR.NOT_ACCNUM);
		if(acc.getBalance()<money)throw new BankException(ERR.LOW_BALANCE);
		accountDAO.updateBalance(acc);
	}
	
	
	
	
}
