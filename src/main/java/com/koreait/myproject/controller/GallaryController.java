package com.koreait.myproject.controller;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class GallaryController {


	//field
	private static final Logger logger = LoggerFactory.getLogger(GallaryController.class);
	
	private SqlSession sqlSession;

	
	
	//constructor
	@Autowired
	public GallaryController(SqlSession sqlSession
							) {
		super();
		this.sqlSession = sqlSession;
		
	}

	@GetMapping(value= "galaryBoardPage.do")
	public String galaryPage() {
		logger.info("galaryPage()");
		return "gallaryBoard/gallaryBoard";
	}
	
	@GetMapping(value="writeBoardPage.do")
	public String writeBoardPage() {
		logger.info("writeBoardPage()");
		return "gallaryBoard/gallaryWrite";
	}
/*
	@PostMapping(value="insertGallaryBoard.do")
	public String insertGallaryBoard(MultipartHttpServletRequest multipartRequest,
									 HttpServletResponse response,
									 Model model) {
		logger.info("insertGallaryBoard()");
		model.addAttribute("multipartRequest", multipartRequest);
		model.addAttribute("response", response);
		insertGallaryBoardCommand.execute(sqlSession, model);
		return "gallaryBoard/gallaryBoard";
	}
*/
}
