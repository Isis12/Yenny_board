package com.spring.ye.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ye.bean.Member;
import com.spring.ye.dao.IMemberDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class MemberMM {
	
	@Autowired
	private IMemberDao mDao;
	
	ModelAndView mav;

	
	public ModelAndView access(Member member, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		
		//스프링 비밀번호 암호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		String pwdEncode = mDao.getSecurityPwd(member.getM_id());
		
		System.out.println("PW= " + pwdEncode);
		
		if (pwdEncode != null) {
			if (pwdEncoder.matches(member.getM_pw(), pwdEncode)) {
				//로그인 성공
				session.setAttribute("id", member.getM_id());
				//로그인 뷰 출력
				member = mDao.getMemberInfo(member.getM_id());
				session.setAttribute("mb", member);
				view = "redirect:/board/boardList";
			} else {
				//비번오류
				view = "redirect:/";
				mav.addObject("check", 2);
			}
		} else {
			//아이디오류
			view = "redirect:/";
			mav.addObject("check", 2);
		}
		
		mav.setViewName(view);
		return mav;
	}
	

	public String idCheck(String m_id) {
		int idCnt = mDao.idCheck(m_id);
		return Integer.toString(idCnt);
	}

	public String phoneCheck(String m_phone) {
		int phoneCnt = mDao.phoneCheck(m_phone);
		return Integer.toString(phoneCnt);
	}


	public ModelAndView memjoin(Member member) {
		mav = new ModelAndView();
		String view = null;
		
		//패스워드 암호화
		BCryptPasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
		member.setM_pw(pwdEncoder.encode(member.getM_pw()));
		if(mDao.memberJoin(member)) {
			view = "redirect:/";
			mav.addObject("check", 1);
		} else {
			view = "/ye/home/join";
		}
		mav.setViewName(view);
		return mav;
	}







}
