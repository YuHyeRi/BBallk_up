package com.gdj37.bballkup.web.teamAdd.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TeamAddDao implements ITeamAddDao {
	@Autowired
	public SqlSession sqlSession;
	
	@Override
	public int teamChk(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("team.teamChk", params);
	}

	@Override
	public int teamAdd(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("team.teamAdd", params);
	}

	@Override
	public int tNmChk(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("team.tNmChk", params);
	}
}
