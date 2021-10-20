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

	@Override
	public int joinMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("login.joinMem", params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMem", params);
	}

	@Override
	public int updateMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("login.updateMem", params);
	}

	@Override
	public int deleteMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("login.deleteMem", params);
	}
	
	
}
