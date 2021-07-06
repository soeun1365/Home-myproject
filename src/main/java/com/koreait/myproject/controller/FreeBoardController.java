package com.koreait.myproject.controller;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class FreeBoardController {


	//field
	private static final Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	private SqlSession sqlSession;
	
	
	//constructor
	@Autowired
	public FreeBoardController(SqlSession sqlSession
							) {
		super();
		this.sqlSession = sqlSession;
		
	}

	@GetMapping(value= "freeBoardPage.do")
	public String freeBoardPage() {
		logger.info("freeBoardPage()");
		return "freeBoard/freeBoard";
	}
	
}
