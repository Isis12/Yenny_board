package com.spring.ye.bean.entity;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
@Alias("boardFile")
public class BoardFile {
	private int bf_num;
	private int bf_bnum;
	private String bf_origname;
	private String bf_sysname;
}
