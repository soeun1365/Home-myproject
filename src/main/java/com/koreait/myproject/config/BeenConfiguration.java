package com.koreait.myproject.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

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

@Configuration
public class BeenConfiguration {
	
	@Bean
	public DriverManagerDataSource dataSource() {
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@127.0.0.1:1521:xe");
		dataSource.setUsername("spring");
		dataSource.setPassword("1111");
		return dataSource;
	}
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		sqlSessionFactory.setDataSource(dataSource());
		sqlSessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:com/koreait/myproject/dao/*.xml"));
		return sqlSessionFactory.getObject();
	}
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	// Member
	@Bean
	public IdCheckCommand idCheckCommand() {
		return new IdCheckCommand();
	}
	@Bean
	public DoubleEmailCommand doubleEmailCommand() {
		return new DoubleEmailCommand();
	}
	@Bean
	public JoinCommand joinCommand() {
		return new JoinCommand();
	}
	@Bean
	public EmailAuthCommand emailAuthCommand() {
		return new EmailAuthCommand();
	}
	@Bean
	public LoginCommand loginCommand() {
		return new LoginCommand();
	}
	@Bean
	public LogoutCommand logoutCommand() {
		return new LogoutCommand();
	}
	@Bean
	public ShowIdByEmailCommand showIdByEmailCommand() {
		return new ShowIdByEmailCommand();
	}
	@Bean
	public ShowIdByNamePhone showIdByNamePhone() {
		return new ShowIdByNamePhone();
	}
	@Bean
	public VerifyEmailCommand verifyEmailCommand() {
		return new VerifyEmailCommand();
	}
	@Bean
	public UpdatePwCommand updatePwCommand() {
		return new UpdatePwCommand();
	}
	@Bean
	public AccountWithdrawResultCommand accountWithdrawResult() {
		return new AccountWithdrawResultCommand();
	}
	// GalleryBoard
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("utf-8");
		multipartResolver.setMaxUploadSize(1024 * 1024 * 10);  // 바이트 단위(10MB)
		return multipartResolver;
	}
	
}
