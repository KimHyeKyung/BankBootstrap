package com.kosta.bank.exception;

public class BankException extends Exception {
	//같은 패키지안에 있는 클래스라 따로 import안해도 된다.
	ERR code;
	
	public BankException(String msg) {
		super(msg);
	}
	
	public BankException(String msg, ERR code) {
		super(msg);
		this.code = code;
	}
	
	public BankException(ERR code) {
		this.code = code;
	}
	
	@Override
	public String toString() {
		String errMsg = "";
		switch (code) {
		case NOT_ACCNUM:
			errMsg += "계좌번호가 틀립니다.";
			break;
		case EXIST_ACCNUM:
			errMsg += "중복된 계좌번호입니다.";
			break;
		case LOW_BALANCE:
			errMsg += "잔액이 부족합니다.";
			break;
		default:
			break;
		}
		return errMsg;
	}
	
}
