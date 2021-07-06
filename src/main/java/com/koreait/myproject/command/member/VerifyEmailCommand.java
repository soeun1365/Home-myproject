package com.koreait.myproject.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MemberDAO;
import com.koreait.myproject.dto.Member;

public class VerifyEmailCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			String email = request.getParameter("email");
			
			Member member = new Member();
			member.setEmail(email);
			
			MemberDAO myProjectDAO = sqlSession.getMapper(MemberDAO.class);
			int state = myProjectDAO.verifyEmail(email);
			
			resultMap.put("state", state);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}

}
