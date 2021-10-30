package com.gdj37.bballkup.web.main.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao implements IMainDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getMain1List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Main.getMain1List", params);
	}

	@Override
	public List<HashMap<String, String>> getMain2List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Main.getMain2List",params);
	}

	@Override
	public List<HashMap<String, String>> getMain3List(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Main.getMain3List",params);
	}

	
}
