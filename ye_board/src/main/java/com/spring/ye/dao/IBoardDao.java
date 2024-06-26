package com.spring.ye.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.spring.ye.bean.Board;
import com.spring.ye.bean.Reply;

@Mapper
@Component
public interface IBoardDao {

	ArrayList<Board> getBoardList(Integer pageNum);

	@Select("SELECT COUNT(*) FROM BOARD")
	int getBoarCount();

	Board getContents(int num);
	
	boolean boardWrite(Board board);

	int boardviewCnt(int num);
	
	@Insert("INSERT INTO BOARD_FILE VALUES(BF_SEQ.NEXTVAL, #{bnum}, #{origFileName}, #{sysFileName})")
	boolean fileInsert(Map<String, String> fMap);

	boolean insertReply(Reply reply);

	List<Reply> getReplyList(int r_bnum);

	@Select("SELECT COUNT(*) FROM RLIST WHERE R_BNUM = #{num}")
	int getReplyCount(int num);

	boolean deleteReply(@Param("num") String num, @Param("Bnum")String Bnum);

	boolean updateReply(@Param("r_contents") String r_contents, @Param("num") String num, @Param("bnum") String bnum);

	boolean modifyContent(Board board);

	boolean deleteBoard(String bnum);

	boolean deleteReply2(String bnum);

	List<Board> boardSearch(@Param("search") String search, @Param("choice") String choice);

	






}
