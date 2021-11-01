package com.gdj37.bballkup.web.team.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TMainDao implements ITMainDao {

	@Autowired
	public SqlSession session;

	@Override
	public List<HashMap<String, String>> tMainList(HashMap<String, String> params) throws Throwable {
		return session.selectList("tmain.tMainList", params);
	}

	@Override
	public HashMap<String, String> tMainDtl(HashMap<String, String> params) throws Throwable {
		return session.selectOne("tmain.tMainDtl", params);
	}

	@Override
	public int teamReg(HashMap<String, String> params) throws Throwable {
		return session.insert("tmain.teamReg", params);
	}

	@Override
	public int teamRegOX(HashMap<String, String> params) throws Throwable {
		return session.selectOne("tmain.teamRegOX", params);
	}

	@Override
	public int applyState(HashMap<String, String> params) throws Throwable {
		return session.selectOne("tmain.applyState", params);
	}


	
} // class end
