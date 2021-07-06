package com.koreait.myproject.dao;

import com.koreait.myproject.dto.Member;

public interface MemberDAO {
	
	public int idCheck(String id);
	public int doubleEmail(String email);
	public int join(Member member);
	public Member login(Member member);
	public String showIdByEmail(String email);
	public String showIdByNamePhone(Member member);
	public int verifyEmail(String email);
	public int updatePw(Member member);
	public void accountWithdraw(String id);
}
