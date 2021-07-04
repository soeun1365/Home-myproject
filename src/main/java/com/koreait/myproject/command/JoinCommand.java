package com.koreait.myproject.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MyProjectDAO;
import com.koreait.myproject.dto.Member;

public class JoinCommand {

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		// join.jsp에서 받아온 값들
		String id = request.getParameter("id");
		String pw1 = request.getParameter("pw1");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = phone1 + "-" + phone2 + "-" + phone3 ;
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		// Member에 담아서
		Member member = new Member();
		member.setId(id);
		member.setPw(pw1);
		member.setName(name);
		member.setPhone(phone);
		member.setEmail(email);
		member.setAddress(address);
		
		//DAO에서 실행
		MyProjectDAO myProjectDAO = sqlSession.getMapper(MyProjectDAO.class);
		myProjectDAO.join(member);
	}

}
