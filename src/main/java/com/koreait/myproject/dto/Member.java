package com.koreait.myproject.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private long mno;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String address;
	private Date regdate;
	private int State;
	
}
