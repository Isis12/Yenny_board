package com.spring.ye.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ye.service.BoardMM;

@Controller
public class BoardController {
	
	@Autowired
	private BoardMM bm;
	
	ModelAndView mav;
	
	@RequestMapping(value = "board/boardList", method = RequestMethod.GET)
	public ModelAndView boardList(Integer pageNum) {
		mav = bm.moveBoardList(pageNum);
		return mav;
	}
	
	@RequestMapping(value = "board/boardContents", method = RequestMethod.GET)
	public ModelAndView boardContents(int bNum, HttpServletRequest request, HttpServletResponse response) {
		mav = bm.boardContents(bNum, request, response);
		return mav;
	}
	
	
	@RequestMapping(value = "board/write", method = RequestMethod.GET)
	public String write(HttpServletRequest request) {
		return "/board/write";
	}
	
	
	@RequestMapping(value = "board/modifyBoard", method = RequestMethod.GET)
	public ModelAndView modifyBoard(int bNum) {
		mav = bm.modifyBoard(bNum);
		return mav;
	}

	
}
