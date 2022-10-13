package com.kosta.bank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.bank.bean.Member;
import com.kosta.bank.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	
	@RequestMapping(value = "/login")
	String login(Model model) {
		model.addAttribute("page", "login_form");
		return "main";
	}
	
	@RequestMapping(value = "/join")
	String join(Model model) {
		model.addAttribute("page", "join_form");
		return "main";
	}
	
	//ȸ������ ����
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	String join(@ModelAttribute Member member ,Model model) {
		try {
			memberService.joinMember(member);
			model.addAttribute("page", "login_form");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "ȸ������ ����");
			model.addAttribute("page", "err");
		}
		return "main";
	}
	
	//�α��� ����
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	String login(@RequestParam("id") String id, @RequestParam("password") String password, Model model) {
		try {
			if(memberService.login(id,password)) {//�α��μ���
				session.setAttribute("id", id);
				model.addAttribute("page", "makeaccount_form");
			}else throw new Exception("�α��� ����");
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "�α��� ����");
			model.addAttribute("page", "err");
		}
		return "main";
	}
	
	//�α׾ƿ�
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	String logout(Model model) {
		try {
			session.removeAttribute("id");
			model.addAttribute("page","login_form");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main";
	}
	
	//���̵� �ߺ�üũ
	//ajax�� ����Ҷ��� @ResponseBody�� ����Ѵ�.
	@ResponseBody
	@RequestMapping(value = "/mid", method = RequestMethod.POST)
	String mid(@RequestParam("id") String id, Model model) {
		try {
			if(memberService.isDoubleId(id)) {
				model.addAttribute("success","false");
				return "true"; //ture�� �ߺ��� �ƾƵ�
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("success","true");
		}
		model.addAttribute("response","true");
		return "false";//false�� ��밡���� ���̵�
	}
	
	
}
