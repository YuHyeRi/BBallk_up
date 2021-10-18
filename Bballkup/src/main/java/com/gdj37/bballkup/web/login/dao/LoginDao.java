package com.gdj37.bballkup.web.login.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao implements ILoginDao {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getLogin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getLogin", params);
	}

	@Override
	public int getMemIdCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMemIdCheck", params);
	}
	
	
}
