package com.koreait.myproject.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MemberDAO;
import com.koreait.myproject.dto.Member;

public class AccountWithdrawResultCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		HttpSession session = (HttpSession)map.get("session");
		
		String id = request.getParameter("id");
		
		Member member = new Member();
		member.setId(id);
		
		MemberDAO myProjectDAO = sqlSession.getMapper(MemberDAO.class);
		myProjectDAO.accountWithdraw(id);
		
		try {
			if(session.getAttribute("loginUser") != null) {
					session.invalidate();
				}
			response.getWriter().println("<script>");
			response.getWriter().println("alert('탈퇴되었습니다.')");
			response.getWriter().println("history.back()");
			response.getWriter().println("</script>");
		}catch(Exception e) {
			e.printStackTrace();
		}

	
		return null;
	}

}
