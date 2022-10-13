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

	//로그인
	@RequestMapping(value = "/", method = RequestMethod.GET)
	String main(Model model) {
		model.addAttribute("page","login_form");
		return "main";
	}
	
	//계좌개설 페이지
	@RequestMapping(value = "/makeaccount", method = RequestMethod.GET)
	String makeAccount(Model model) {
		model.addAttribute("page", "makeaccount_form");
		return "main";
	}
	
	//함수는 메서드 오버로딩에 의해서 함수명이 똑같아도 매개변수의 개수나 타입에 따라서 다른 메서드로 인식된다.
	@RequestMapping(value = "/make_account", method = RequestMethod.POST)
	String makeAccount(@ModelAttribute Account acc, Model model) {
		//반드시 컨트롤러에서 예외처리를 해야한다.
		try {
			accountService.makeAccount(acc);
			model.addAttribute("success","true");
			model.addAttribute("acc",acc);
			model.addAttribute("page","makeaccount_form");
		} catch(BankException e) {	//자식클래스 먼저!!
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", e.toString());
			model.addAttribute("page", "makeaccount_form");
		} catch (Exception e) {		//항상 부모클래스가 밑에 와야한다.
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", "계좌개설 실패");
			model.addAttribute("page", "makeaccount_form");
		}
		model.addAttribute("response","true");
		return "main";
	}

	//입금페이지
	@RequestMapping(value = "/deposit", method = RequestMethod.GET)
	String deposit(Model model) {
		model.addAttribute("page", "deposit_form");
		return "main";
	}
	
	//입금수행
	@RequestMapping(value = "/deposit", method = RequestMethod.POST)
	ModelAndView deposit(Model model, @RequestParam("id") String id, @RequestParam("money") int money) {
		ModelAndView mav = new ModelAndView("main");
		try {
			accountService.deposit(id, money);
			model.addAttribute("money", money);
			model.addAttribute("success","true");
			model.addAttribute("page", "deposit_form");
		} catch(BankException e) {	//자식클래스 먼저!!
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", e.toString());
			model.addAttribute("page", "deposit_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", "입금 실패");
			model.addAttribute("page", "deposit_form");
		}
		model.addAttribute("response","true");
		return mav;
	}
	
	//출금페이지
	@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
	String withdraw(Model model) {
		model.addAttribute("page", "withdraw_form");
		return "main";
	}
	
	//출금수행
	@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
	String withdraw(Model model, @RequestParam("id") String id, @RequestParam("money") int money) {
		try {
			accountService.withdraw(id, money);
			model.addAttribute("id", id);
			model.addAttribute("money",money);
			model.addAttribute("success","true");
			model.addAttribute("page","withdraw_form");
		}catch(BankException e) {	//자식클래스 먼저!!
			e.printStackTrace();
			model.addAttribute("success","false");
			model.addAttribute("err", e.toString());
			model.addAttribute("page", "withdraw_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "출금 실패");
			model.addAttribute("page", "err");
			model.addAttribute("page", "withdraw_form");
		}
		model.addAttribute("response","true");
		return "main";
	}
	
	//계좌조회 페이지
	@RequestMapping(value = "/accinfo", method = RequestMethod.GET)
	String accinfo(Model model) {
		model.addAttribute("page", "accinfo_form");
		return "main";
	}
	
	//계좌조회 수행
	@RequestMapping(value = "/acc_info", method = RequestMethod.POST)
	String accinfo(@RequestParam("id") String id, Model model) {
		try {
			Account acc = accountService.selectAccount(id);
			if(acc==null) throw new Exception();
			model.addAttribute("acc", acc);
			model.addAttribute("page","accinfo_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "계좌조회 실패");
			model.addAttribute("page", "err");
		}
		return "main";
	}
	
	//전체계좌 조회
	@RequestMapping(value = "/allaccinfo", method = RequestMethod.GET)
	String allaccinfo(Model model) {
		try {
			List<Account> accs = accountService.selectAccountList();
			model.addAttribute("accs", accs);
			model.addAttribute("page","allaccinfo_success");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "전체계좌조회 실패");
			model.addAttribute("page", "err");
		}
		return "main";
	}
	
	
	//계좌 중복체크
	//ajax를 사용할때는 @ResponseBody를 써야한다.
	@ResponseBody
	@RequestMapping(value = "/accountId", method = RequestMethod.POST)
	String accountId(@RequestParam("id") String id) {
		try {
			if(accountService.isDoubleAccountId(id)) {
				return "true"; //ture면 중복된 계좌
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "false";//false면 사용가능한 계좌
	}
		
	
	
}
