package com.spring.ye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ye.bean.Member;
import com.spring.ye.service.AdminMM;

@Controller
public class AdminController {
	
	@Autowired
	private AdminMM am;
	
	ModelAndView mav;
	
	
	
	@RequestMapping(value = "admin/adminInfo", method = RequestMethod.GET)
	public ModelAndView adminInfo(){
		mav = am.adminInfo();
		return mav;
	}
	
	//탈퇴회원
	@RequestMapping(value = "admin/memWithdrawal", method = RequestMethod.GET)
	public ModelAndView memWithdrawal(){
		mav = am.memWithdrawal();
		return mav;
	}
	
	@RequestMapping(value = "admin/getModalInfo", method = RequestMethod.GET)
	public ModelAndView modalMemInfo(String m_id) {
		try {
			System.out.println("컨트롤러는?" + m_id);
			mav = am.modalMemInfo(m_id);
			return mav;
			
		} catch (NullPointerException e) {
			// NullPointerException 처리
            e.printStackTrace(); // 예외 정보를 출력하거나 로그에 기록할 수 있음
            mav.setViewName("errorPage"); // 에러 페이지로 이동하거나 적절한 처리를 할 수 있음
            mav.addObject("error", "NullPointerException occurred: " + e.getMessage()); // 에러 메시지 추가
			return mav;
		}

	}
	
	@PostMapping(value = "admin/modifyMember")
	public ModelAndView modifyMember(Member member) {
		mav = am.modifyMember(member);
		return mav;
	}
	
	
	@PostMapping(value = "admin/updateGrade")
	public ModelAndView updateGrade(String code, String id) {
		mav = am.updateGrade(code, id);
		return mav;
	}
	
	@PostMapping(value = "admin/MemSecession") 
	public ModelAndView secession(String id) {
		mav= am.secession(id);
		return mav;
	}
	
	@PostMapping(value = "admin/restoreMem") 
	public ModelAndView restoreMem(String id) {
		mav = am.restoreMem(id);
		return mav;
	}
	
	@PostMapping(value = "admin/deleteMember") 
	public ModelAndView deleteMember(String id) {
		mav = am.deleteMember(id);
		return mav;
	}
	
}
