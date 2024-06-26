package com.spring.ye.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Alias("member")
@Accessors(chain = true)
public class Member {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_birth;
	private String m_phone;
	private String m_addr_num;
	private String m_addr;
	private String m_addr_det;
	private String m_point;
	private String m_gcode;
	private String m_date;
	private String RN;
	private String mCnt;
	
	private String g_name;
}

