package com.spring.ye.bean;

import java.util.List;

import org.apache.ibatis.type.Alias;

import com.spring.ye.bean.entity.BoardFile;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("board")
@Accessors(chain = true)
public class Board {
	private String b_num;
	private String b_title;
	private String b_contents;
	private String b_writer;
	private String b_views;
	private String b_date;
	private String b_type;
	private String b_pw;
	private String RN;
	private String RCNT;
	
	//첨부파일
	private List<BoardFile> bfList; 
}
