package com.koreait.myproject.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.myproject.command.member.AccountWithdrawResultCommand;
import com.koreait.myproject.command.member.DoubleEmailCommand;
import com.koreait.myproject.command.member.EmailAuthCommand;
import com.koreait.myproject.command.member.IdCheckCommand;
import com.koreait.myproject.command.member.JoinCommand;
import com.koreait.myproject.command.member.LoginCommand;
import com.koreait.myproject.command.member.LogoutCommand;
import com.koreait.myproject.command.member.ShowIdByEmailCommand;
import com.koreait.myproject.command.member.ShowIdByNamePhone;
import com.koreait.myproject.command.member.UpdatePwCommand;
import com.koreait.myproject.command.member.VerifyEmailCommand;

@org.springframework.stereotype.Controller
public class MemberController {


	//field
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private SqlSession sqlSession;
	private IdCheckCommand idCheckCommand;
	private JoinCommand joinCommand;
	private EmailAuthCommand emailAuthCommand;
	private LoginCommand loginCommand;
	private LogoutCommand logoutCommand;
	private ShowIdByEmailCommand showIdByEmailCommand;
	private ShowIdByNamePhone showIdByNamePhone;
	private UpdatePwCommand updatePwCommand;
	private AccountWithdrawResultCommand accountWithdrawResult;
	private VerifyEmailCommand verifyEmailCommand;
	private DoubleEmailCommand doubleEmailCommand;
	
	//constructor
	@Autowired
	public MemberController(SqlSession sqlSession,
							IdCheckCommand idCheckCommand,
							JoinCommand joinCommand,
							EmailAuthCommand emailAuthCommand,
							LoginCommand loginCommand,
							LogoutCommand logoutCommand,
							ShowIdByEmailCommand showIdByEmailCommand,
							ShowIdByNamePhone showIdByNamePhone,
							UpdatePwCommand updatePwCommand,
							AccountWithdrawResultCommand accountWithdrawResult,
							VerifyEmailCommand verifyEmailCommand,
							DoubleEmailCommand doubleEmailCommand) {
		super();
		this.sqlSession = sqlSession;
		this.idCheckCommand = idCheckCommand;
		this.joinCommand = joinCommand;
		this.emailAuthCommand = emailAuthCommand;
		this.loginCommand = loginCommand;
		this.logoutCommand = logoutCommand;
		this.showIdByEmailCommand = showIdByEmailCommand;
		this.showIdByNamePhone = showIdByNamePhone;
		this.updatePwCommand = updatePwCommand;
		this.accountWithdrawResult = accountWithdrawResult;
		this.verifyEmailCommand = verifyEmailCommand;
		this.doubleEmailCommand = doubleEmailCommand;
	}

	@GetMapping(value= {"/", "index.do"})
	public String index() {
		logger.info("index()");
		return "index";
	}
	
	@GetMapping(value="loginPage.do")
	public String loginPage() {
		logger.info("loginPage()");
		return "member/login";
	}
	
	@GetMapping(value="joinPage.do")
	public String joinPage() {
		logger.info("joinPage()");
		return "member/join";
	}
	
	@GetMapping(value="idCheck.do",
			 	produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> idCheck(HttpServletRequest request,
						 				Model model) {
		logger.info("idCheck()");
		model.addAttribute("request", request);
		return idCheckCommand.execute(sqlSession, model);
	}
	@GetMapping(value="doubleEmail",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> doubleEmail(HttpServletRequest request,
										   Model model){
		logger.info("doubleEmail()");
		model.addAttribute("request", request);
		return doubleEmailCommand.execute(sqlSession, model);
	}
	
	@PostMapping(value="join.do")
	public void join(HttpServletRequest request,
					   HttpServletResponse response,
					   Model model) {
		logger.info("join()");
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		joinCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="verifyNum.do",
				produces="application/json; charset=utf-8")
	@ResponseBody
		public Map<String, String> verifyNum(HttpServletRequest request, 
							  				 Model model) {
		logger.info("verifyNum()");
		model.addAttribute("request", request);
		return emailAuthCommand.execute(sqlSession, model);
	}
	
	@PostMapping(value="login.do",
				 produces="application/json; utf-8")
	@ResponseBody
	public void login(HttpServletRequest request,
						HttpServletResponse response,
						Model model){
		logger.info("login()");
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		loginCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="findIdByNamePhone.do")
	public String findId() {
		logger.info("findIdByNamePhone()");
		return "member/findIdByNamePhone";
	}
	
	@GetMapping(value="findIdByEmail.do")
	public String findIdByEmail() {
		logger.info("findIdByEmail()");
		return "member/findIdByEmail";
	}
	
	@GetMapping(value="logout.do")
	public String logout(HttpSession session,
						 Model model){
		logger.info("logout()");
		model.addAttribute("session", session);
		logoutCommand.execute(sqlSession, model);
		return "index";
	}
	
	@PostMapping(value="showIdByEmail.do")
	public String showIdByEmail(HttpServletRequest request,
								Model model) {
		logger.info("showIdByEmail()");
		model.addAttribute("request", request);
		showIdByEmailCommand.execute(sqlSession, model);
		return "member/showId";
	}
	
	@PostMapping(value="showIdByNamePhone.do")
	public String showIdByNamePhone(HttpServletRequest request,
									Model model) {
		logger.info("showIdByNamePhone()");
		model.addAttribute("request", request);
		showIdByNamePhone.execute(sqlSession, model);
		return "member/showId";
	}
	@GetMapping(value="verifyEmail.do",
				produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> verifyEmail(HttpServletRequest request,
							Model model) {
		logger.info("verifyEmail()");
		model.addAttribute("request", request);
		return verifyEmailCommand.execute(sqlSession, model);
	}
	
	@GetMapping(value="findPwPage.do")
	public String findPwPage() {
		logger.info("findPwPage()");
		return "member/findPw";
	}
	
	@GetMapping(value="showPwPage.do")
	public String showPwPage() {
		logger.info("showPwPage()");
		return "member/showPw";
	}
	
	@PostMapping(value="updatePw.do")
	public String updatePw(HttpServletRequest request,
						   HttpServletResponse response,
						   @ModelAttribute("email") String email,
						   Model model) {
		logger.info("updatePw");
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		updatePwCommand.execute(sqlSession, model);
		return loginPage();
	}
	
	@GetMapping(value="accountWithdrawPage.do")
	public String accountWithdrawPage() {
		logger.info("accountWithdrawPage()");
		return "member/accountWithdraw";
	}
	
	@PostMapping(value="accountWithdrawResult.do")
	public String accountWithdrawResult(HttpServletRequest request,
										HttpServletResponse response,
										HttpSession session,
										Model model) {
		logger.info("accountWithdrawResult()");
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		model.addAttribute("session", session);
		accountWithdrawResult.execute(sqlSession, model);
		return "member/accountWithdrawResult";
	}
}
