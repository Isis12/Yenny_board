package com.spring.ye.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ye.bean.Member;
import com.spring.ye.service.MemberMM;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MemberMM mm;//new MemberMM();
	
	ModelAndView mav;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("로그창으로 이동");
		return "home/home";
	}
	
	@RequestMapping(value = "/access", method = RequestMethod.POST)
	public ModelAndView access(Member member, HttpSession session) {
		mav = mm.access(member, session);
		return mav;
	}
	
	
	@RequestMapping(value = "home/dupleID", method = RequestMethod.GET)
	@ResponseBody
	public String dupleID(String m_id) {
		System.out.println("id=" + m_id);
		String reuslt = mm.idCheck(m_id);
		return reuslt;
	}
	
	@RequestMapping(value = "home/duplePhone", method = RequestMethod.GET)
	@ResponseBody
	public String duplePhone(String m_phone) {
		System.out.println("phone= " + m_phone);
		String result = mm.phoneCheck(m_phone);
		return result;
	}
	
	@RequestMapping(value = "home/join", method = RequestMethod.GET)
	public ModelAndView joinFrm() {
		mav = new ModelAndView();
		mav.setViewName("home/join");
		return mav;
	}
	
	@RequestMapping(value = "home/memJoin", method = RequestMethod.POST)
	public ModelAndView memJoin(Member member) {
		mav = mm.memjoin(member);
		return mav;
	}

	@RequestMapping(value = "board/logout", method = RequestMethod.POST)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
	
	
}

