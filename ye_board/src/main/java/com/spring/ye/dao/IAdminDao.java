package com.spring.ye.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Component;

import com.spring.ye.bean.Member;

@Mapper
@Component
public interface IAdminDao {

	List<Member> adminList();
	
	@Select("SELECT COUNT(*) FROM MEMBER WHERE DEL_YN = 'N'")
	int getMemberCount();

	List<Member> WithdrawalList();

	@Select("SELECT COUNT(*) FROM MEMBER WHERE DEL_YN ='Y'")
	int withdrawalCount();

	Member getModalMemInfo(String m_id);

	boolean modifyMember(Member member);

	boolean UpdateGrade(@Param("code") String code, @Param("id") String id);

	boolean memSecession(String id);

	@Update("UPDATE MEMBER SET DEL_YN = 'N' WHERE M_ID = #{id}")
	boolean restoreMem(String id);

	boolean removeReply(String id);

	boolean removeBoard(String id);

	boolean deleteMember(String id);

}
