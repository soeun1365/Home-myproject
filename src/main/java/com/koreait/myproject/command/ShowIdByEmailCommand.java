package com.koreait.myproject.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MyProjectDAO;
import com.koreait.myproject.dto.Member;

public class ShowIdByEmailCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String email = request.getParameter("email");
		Member member = new Member();
		member.setEmail(email);
		
		MyProjectDAO myProjectDAO = sqlSession.getMapper(MyProjectDAO.class);
		String id = myProjectDAO.showIdByEmail(email);
		
		if(id != null) {
			model.addAttribute("id", id);
		}
		return null;
	}

}
