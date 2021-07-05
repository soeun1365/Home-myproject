package com.koreait.myproject.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MyProjectDAO;
import com.koreait.myproject.dto.Member;

public class JoinCommand {

	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		
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
		int count = myProjectDAO.join(member);
		
		response.setContentType("text/html; charset=utf-8"); 
		try {
			if(count > 0) {
				response.getWriter().println("<script>");
				response.getWriter().println("alert('회원가입이 완료되었습니다.')");
				response.getWriter().println("location.href='index.do'");
				response.getWriter().println("</script>");
			} else if(count == 0){
				response.getWriter().println("<script>");
				response.getWriter().println("alert('회원가입에 실패하였습니다.')");
				response.getWriter().println("history.back()");
				response.getWriter().println("</script>");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
