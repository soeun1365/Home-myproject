package com.koreait.myproject.command.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.myproject.dao.MemberDAO;

public class IdCheckCommand implements MemberCommand{
	
@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		MemberDAO myProjectDAO = sqlSession.getMapper(MemberDAO.class);
		
		int count = myProjectDAO.idCheck(id);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("count", count);
		
		return resultMap;

	}

}
