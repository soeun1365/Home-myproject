package com.koreait.myproject.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MyProjectDAO;
import com.koreait.myproject.dto.Member;

public class LoginCommand{

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Member member = new Member();
		member.setId(id);
		member.setPw(pw);
		
		MyProjectDAO myProjectDAO = sqlSession.getMapper(MyProjectDAO.class);
		Member loginUser = myProjectDAO.login(member);
		
		if(loginUser != null ) {
			request.getSession().setAttribute("loginUser", loginUser);	//세션에 올림
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("loginUser", loginUser);
		response.setContentType("text/html; charset=utf-8"); 
		try {
			if(loginUser == null) {
				response.getWriter().println("<script>");
				response.getWriter().println("alert('로그인에 실패하였습니다.')");
				response.getWriter().println("history.back()");
				response.getWriter().println("</script>");
			} else if(loginUser != null) {
				response.getWriter().println("<script>");
				response.getWriter().println("alert('로그인에 성공하였습니다.')");
				response.getWriter().println("location.href='index.do'");
				response.getWriter().println("</script>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}

}
