package com.spring.ye.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ye.bean.Board;
import com.spring.ye.bean.Reply;
import com.spring.ye.service.BoardMM;

@RestController
@RequestMapping(value = "/rest")
public class BoardRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private BoardMM bm;
	
	ModelAndView mav;
	

	@PostMapping(value = "board/writeBoard")
	public String writeBoard(Board board, HttpSession session) {
		String value = bm.writeBoard(board, session);
		return value;
	}
	
	@PostMapping(value = "board/modifyContent") 
	public String modifyContent(Board board) {
		String value = bm.modifyContent(board);
		return value;
	}
	
	@RequestMapping(value = "board/insertReply", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	public Map<String, List<Reply>> insertReply(Reply reply, HttpSession session) {
		reply.setR_id(session.getAttribute("id").toString());
		Map<String, List<Reply>> rMap = bm.insertReply(reply, session);
		return rMap;
	}
	
	@PostMapping(value = "board/deleteReply")
	public String delteReply(String num, String Bnum) {
		String value = bm.deleteReply(num, Bnum);
		return value;
	}
	
	@PostMapping(value = "board/updateReply")
	public String updateReply(String r_contents, String num, String bnum) {
		String value = bm.updateReply(r_contents, num, bnum);
		return value;
	}
	
	@PostMapping(value = "board/deleteBoard")
	public String deleteBoard(String bnum) {
		String value = bm.deleteBoard(bnum);
		return value;
	}
	
	@PostMapping(value = "board/boardSearch")
	public Map<String, List<Board>> boardSearch(String search, String choice) {
		System.out.println("choice=" + choice);
		System.out.println("search=" + search);
		
		Map<String, List<Board>> bMap = bm.boardSearch(search,choice);
		return bMap;
	}

	
}

