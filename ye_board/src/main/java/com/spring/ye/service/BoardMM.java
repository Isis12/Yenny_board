package com.spring.ye.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.spring.ye.bean.Board;
import com.spring.ye.bean.Reply;
import com.spring.ye.dao.IBoardDao;
import com.spring.ye.userClass.FileManager;
import com.spring.ye.userClass.Paging;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class BoardMM {
	
	@Autowired
	private IBoardDao bDao;
	
	@Autowired
	private FileManager fm;
	
	ModelAndView mav;
	
	
	public ModelAndView moveBoardList(Integer pageNum) {
		System.out.println("pageNum="+pageNum);
		mav = new ModelAndView();
		String view = null;
		ArrayList<Board> bList = null;
		pageNum=(pageNum==null)?1:pageNum;
		if(pageNum<=0) {
			System.out.println("잘못된 페이지 번호");

		}
		bList = bDao.getBoardList(pageNum);
		if(bList!=null && bList.size()!=0) {
			Gson gson = new Gson();
			String json = gson.toJson(bList);
			mav.addObject("bList", json);
			mav.addObject("paging", getPaging(pageNum));
		}
		mav.setViewName(view);
		return mav;
	}

	private String getPaging(Integer pageNum) {
		int maxNum = bDao.getBoarCount();
		int listCount=10;
		int pageCount=5;
		String boardName="/ye/board/boardList";
		Paging paging= new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}


	public ModelAndView boardContents(int bNum, HttpServletRequest request, HttpServletResponse response) {
		mav = new ModelAndView();
		String view = null;
		int num = bNum;
		
		Board board = bDao.getContents(num);
		
		//쿠키 조회수방지
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null ) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}
		
		if(oldCookie != null ) {
			if(!oldCookie.getValue().contains("[" + num + "]")) {
				boardviewCnt(num);
				oldCookie.setValue(oldCookie.getValue() + "_[" + num + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60*60*24);
				response.addCookie(oldCookie);
			}
		} else {
			boardviewCnt(num);
			Cookie newCookie = new Cookie("postView", "[" + num + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60*60*24);
	        response.addCookie(newCookie);
	        System.out.println(newCookie);
		}
		
		//댓글 총갯수
		int replyCnt = bDao.getReplyCount(num);
		
		List<Reply> rList = bDao.getReplyList(num);
				
		mav.addObject("board", board);
		mav.addObject("rList", rList);
		mav.addObject("replyCnt", replyCnt);
		
		view = "/board/boardContents";
		mav.setViewName(view);
		return mav;
	}
	
	//게시판 조회수
	private String boardviewCnt(int num) {
		int Cnt = bDao.boardviewCnt(num);
		return Integer.toString(Cnt);
	}
	
	
	public String writeBoard(Board board, HttpSession session) {
		String value = null;
		
		boolean result = bDao.boardWrite(board);
		
		if(result) {
			value = "1";
		}else {
			value = "2";
		}
		return value;
	}

	
	public Map<String, List<Reply>> insertReply(Reply reply, HttpSession session) {
		//String bNum = session.getAttribute("id").toString();
		Map<String, List<Reply>> rMap = null;
		List<Reply> rList = null;
		
		if(bDao.insertReply(reply)) {
			rList = bDao.getReplyList(reply.getR_bnum());
			rMap = new HashMap<>();
			rMap.put("rList", rList);
			System.out.println("rList= " + rList);
		}else {
			rMap = null;
		}
		return rMap;
	}
	
	
	public String deleteReply(String num, String Bnum) {
		String value = null;
		
		boolean result = bDao.deleteReply(num, Bnum);
		
		if(result) {
			value = "1";
		}else {
			value = "2";
		}
		return value;
	}

	
	public String updateReply(String r_contents, String num, String bnum) {
		String value = null;
		
		boolean result = bDao.updateReply(r_contents, num, bnum);
		
		if(result) {
			value = "1";
		}else {
			value = "2";
		}
		return value;
	}
	
	
	public ModelAndView modifyBoard(int bNum) {
		mav = new ModelAndView();
		String view = null;
		int num = bNum;
		
		Board board = bDao.getContents(num);
		
		mav.addObject("board", board);
		view = "/board/modifyBoard";
		mav.setViewName(view);
		return mav;
	}

	
	public String modifyContent(Board board) {
		String value = null;
		
		board.setB_contents(board.getB_contents().replaceAll("\r\n", "<br>"));
		
		boolean result = bDao.modifyContent(board);
		
		if(result) {
			value = "1";
		}else {
			value= "2";
		}
		return value;
	}

	
	public String deleteBoard(String bnum) {
		String value = null;
		
		//댓글 삭제
		boolean reply = bDao.deleteReply2(bnum);
		boolean result = bDao.deleteBoard(bnum);
		
		if(result && reply) {
			value = "1";
		}else {
			value = "2";
		}
		return value;
	}

	
	public Map<String, List<Board>> boardSearch(String search, String choice) {
		Map<String, List<Board>> bMap = null;
		List<Board> bList = bDao.boardSearch(search, choice);
		
		if(bList != null) {
			bMap = new HashMap<>();
			bMap.put("bList", bList);
			System.out.println("bList=" + bList);
		}else {
			bMap = null;
		}
		return bMap;
	}
		

}
