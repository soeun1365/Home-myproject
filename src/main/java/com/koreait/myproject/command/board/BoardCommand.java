package com.koreait.myproject.command.board;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface BoardCommand {
	public Map<String, Object> execute(SqlSession sqlSession, Model model);
}
