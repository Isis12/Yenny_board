package com.spring.ye.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.ye.bean.Member;
import com.spring.ye.dao.IAdminDao;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class AdminMM {

	@Autowired
	private IAdminDao aDao;
	
	ModelAndView mav;

	
	public ModelAndView adminInfo() {
		mav = new ModelAndView();
		String view = null;
		List<Member> aList = null;
		aList = aDao.adminList();
		
		//회원카운트
		int MemCnt = aDao.getMemberCount();
		
		if(aList!=null && aList.size()!=0) {
			mav.addObject("aList", new Gson().toJson(aList));
			mav.addObject("memCnt", MemCnt);
		}
		mav.setViewName(view);
		return mav;
	}



	public ModelAndView memWithdrawal() {
		mav = new ModelAndView();
		String view = null;
		List<Member> aList = null;
		aList = aDao.WithdrawalList();
		
		//탈퇴회원카운트
		int MemCnt = aDao.withdrawalCount();
		
		if(aList!=null && aList.size()!=0) {
			Gson gson = new Gson();
			String json = gson.toJson(aList);
			mav.addObject("aList", json);
			mav.addObject("memCnt", MemCnt);
		}
		mav.setViewName(view);
		return mav;
	}



	public ModelAndView modalMemInfo(String m_id) {
		System.out.println("id="+m_id);
		mav = new ModelAndView();
		String view = null;
		
		Member member = aDao.getModalMemInfo(m_id);
		
		mav.addObject("member", member);
		
		view = "/admin/adminMemDetail";
		mav.setViewName(view);
		
		return mav;
	}


	public ModelAndView modifyMember(Member member) {
		mav = new ModelAndView();
		String view = null;

		member.setM_phone(member.getM_phone().replaceAll("-", ""));
		boolean result = aDao.modifyMember(member);
	
		if(result) {
			view = "/admin/adminInfo";
			mav.addObject("check", 1);
		}
		mav.setViewName(view);
		return mav;
	}



	public ModelAndView updateGrade(String code, String id) {
		mav = new ModelAndView();
		String view = null;
		
		boolean result = aDao.UpdateGrade(code, id);
		
		if(result) {
			view = "/admin/adminInfo";
			mav.addObject("check", 1);
		}
		mav.setViewName(view);
		return mav;
	}



	public ModelAndView secession(String id) {
		mav = new ModelAndView();
		String view = null;
		
		boolean result = aDao.memSecession(id);
		
		if(result) {
			view = "/admin/memWithdrawal";
			mav.addObject("check", 1);
		}
		mav.setViewName(view);
		return mav;
	}


	public ModelAndView restoreMem(String id) {
		mav = new ModelAndView();
		String view = null;

		boolean result = aDao.restoreMem(id);
		if(result) {
			view = "/admin/adminInfo";
			mav.addObject("check", 1);
		}
		mav.setViewName(view);
		return mav;
	}


	public ModelAndView deleteMember(String id) {
		mav = new ModelAndView();
		String view = null;
		
	    try {
            boolean reply = aDao.removeReply(id);
            boolean board = aDao.removeBoard(id);
            boolean result = aDao.deleteMember(id);

            if (result || reply || board) {
                view = "/admin/adminInfo";
                mav.addObject("check", 1);
            } else {
                mav.addObject("check", 0); // 실패 시에도 값을 설정해줍니다.
            }
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace(); // 콘솔에 예외 스택 추적을 출력합니다.
        }

        mav.setViewName(view);
        return mav;
    }
}
