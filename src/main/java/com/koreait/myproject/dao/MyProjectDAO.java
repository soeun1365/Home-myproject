package com.koreait.myproject.dao;

import com.koreait.myproject.dto.Member;

public interface MyProjectDAO {
	
	public int idCheck(String id);
	public int join(Member member);
	public Member login(Member member);
	public String showIdByEmail(String email);
	public String showIdByNamePhone(Member member);
	public int updatePw(Member member);
}
