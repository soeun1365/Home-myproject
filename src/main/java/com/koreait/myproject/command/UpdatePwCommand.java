package com.koreait.myproject.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MyProjectDAO;
import com.koreait.myproject.dto.Member;

public class UpdatePwCommand implements MemberCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		
		model.addAttribute("email", email);
		
		Member member = new Member();
		member.setPw(pw);
		member.setEmail(email);
		
		MyProjectDAO myProjectDAO = sqlSession.getMapper(MyProjectDAO.class);
		int result = myProjectDAO.updatePw(member);
		
		try {
			if(result > 0) {
				response.setContentType("text/html; charset=utf-8"); 
				response.getWriter().println("<script>");
				response.getWriter().println("alert('비밀번호가 변경되었습니다.')");
				response.getWriter().println("location.href='index.do'");
				response.getWriter().println("</script>");
			} else if(result == 0) {
				response.getWriter().println("<script>");
				response.getWriter().println("alert('비밀번호 변경에 실패하였습니다.')");
				response.getWriter().println("history.back()");
				response.getWriter().println("</script>");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}	
		return null;
	}

}
