package com.kosta.bank.exception;

public class BankException extends Exception {
	//���� ��Ű���ȿ� �ִ� Ŭ������ ���� import���ص� �ȴ�.
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
			errMsg += "���¹�ȣ�� Ʋ���ϴ�.";
			break;
		case EXIST_ACCNUM:
			errMsg += "�ߺ��� ���¹�ȣ�Դϴ�.";
			break;
		case LOW_BALANCE:
			errMsg += "�ܾ��� �����մϴ�.";
			break;
		default:
			break;
		}
		return errMsg;
	}
	
}
