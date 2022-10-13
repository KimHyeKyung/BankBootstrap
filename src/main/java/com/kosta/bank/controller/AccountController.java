package com.kosta.bank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.bank.bean.Account;
import com.kosta.bank.exception.BankException;
import com.kosta.bank.service.AccountService;

@Controller
public class AccountController {

	@Autowired
	AccountService accountService;

	//�α���
	@RequestMapping(value = "/", method = RequestMethod.GET)
	String main(Model model) {
		model.addAttribute("page","login_form");
		return "main";
	}
	
	//���°��� ������
	@RequestMapping(value = "/makeaccount", method = RequestMethod.GET)
	String makeAccount(Model model) {
		model.addAttribute("page", "makeaccount_form");
		return "main";
	}
	
	//�Լ��� �޼��� �����ε��� ���ؼ� �Լ����� �Ȱ��Ƶ� �Ű������� ������ Ÿ�Կ� ���� �ٸ� �޼���� �νĵȴ�.
	@RequestMapping(value = "/make_account", method = RequestMethod.POST)
	String makeAccount(@ModelAttribute Account acc, Model model) {
		//�ݵ�� ��Ʈ�ѷ����� ����ó���� �ؾ��Ѵ�.
		try {
			accountService.makeAccount(acc);
			model.addAttribute("success","true");
			model.addAttribute("acc",acc);
			model.addAttribute("page","makeaccount_form");
		} catch(BankException e) {	//�ڽ�Ŭ���� ����!!
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", e.toString());
			model.addAttribute("page", "makeaccount_form");
		} catch (Exception e) {		//�׻� �θ�Ŭ������ �ؿ� �;��Ѵ�.
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", "���°��� ����");
			model.addAttribute("page", "makeaccount_form");
		}
		model.addAttribute("response","true");
		return "main";
	}

	//�Ա�������
	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	String deposit(Model model) {
		model.addAttribute("page", "deposit_form");
		return "main";
	}
	
	//�Աݼ���
	@RequestMapping(value = "/deposit", method = RequestMethod.POST)
	ModelAndView deposit(Model model, @RequestParam("id") String id, @RequestParam("money") int money) {
		ModelAndView mav = new ModelAndView("main");
		try {
			accountService.deposit(id, money);
			model.addAttribute("money", money);
			model.addAttribute("success","true");
			model.addAttribute("page", "deposit_form");
		} catch(BankException e) {	//�ڽ�Ŭ���� ����!!
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", e.toString());
			model.addAttribute("page", "deposit_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", "�Ա� ����");
			model.addAttribute("page", "deposit_form");
		}
		model.addAttribute("response","true");
		return mav;
	}
	
	//���������
	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	String withdraw(Model model) {
		model.addAttribute("page", "withdraw_form");
		return "main";
	}
	
	//��ݼ���
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	String withdraw(Model model, @RequestParam("id") String id, @RequestParam("money") int money) {
		try {
			accountService.withdraw(id, money);
			model.addAttribute("id", id);
			model.addAttribute("money",money);
			model.addAttribute("success","true");
			model.addAttribute("page","withdraw_form");
		}catch(BankException e) {	//�ڽ�Ŭ���� ����!!
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", e.toString());
			model.addAttribute("page", "withdraw_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "��� ����");
			model.addAttribute("page", "err");
			model.addAttribute("page", "withdraw_form");
		}
		model.addAttribute("response","true");
		return "main";
	}
	
	//������ȸ ������
	@RequestMapping(value = "/accinfo", method = RequestMethod.GET)
	String accinfo(Model model) {
		model.addAttribute("page", "accinfo_form");
		return "main";
	}
	
	//������ȸ ����
	@RequestMapping(value = "/acc_info", method = RequestMethod.POST)
	String accinfo(@RequestParam("id") String id, Model model) {
		try {
			Account acc = accountService.selectAccount(id);
			if(acc==null) throw new Exception();
			model.addAttribute("acc", acc);
			model.addAttribute("page","accinfo_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "������ȸ ����");
			model.addAttribute("page", "err");
		}
		return "main";
	}
	
	//��ü���� ��ȸ
	@RequestMapping(value = "/allaccinfo", method = RequestMethod.GET)
	String allaccinfo(Model model) {
		try {
			List<Account> accs = accountService.selectAccountList();
			model.addAttribute("accs", accs);
			model.addAttribute("page","allaccinfo_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "��ü������ȸ ����");
			model.addAttribute("page", "err");
		}
		return "main";
	}
	
	
	//���� �ߺ�üũ
	//ajax�� ����Ҷ��� @ResponseBody�� ����Ѵ�.
	@ResponseBody
	@RequestMapping(value = "/accountId", method = RequestMethod.POST)
	String accountId(@RequestParam("id") String id) {
		try {
			if(accountService.isDoubleAccountId(id)) {
				return "true"; //ture�� �ߺ��� ����
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";//false�� ��밡���� ����
	}
		
	
	
}
