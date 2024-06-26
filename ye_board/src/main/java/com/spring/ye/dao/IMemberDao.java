package com.spring.ye.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import com.spring.ye.bean.Member;

@Mapper
@Component
public interface IMemberDao {

	String getSecurityPwd(String id);

	Member getMemberInfo(String id);
	
	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_ID = #{m_id}")
	int idCheck(String m_id);

	@Select("SELECT COUNT(*) FROM MEMBER WHERE M_PHONE = #{m_phone}")
	int phoneCheck(String m_phone);

	boolean memberJoin(Member member);

	ArrayList<Member> getMemberList(Integer pageNum);






	













	







}
