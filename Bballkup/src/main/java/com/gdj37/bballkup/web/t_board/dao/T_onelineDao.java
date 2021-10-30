package com.gdj37.bballkup.web.t_board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class T_onelineDao implements IT_onelineDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> tOneList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("tOneline.tOneList", params);
	}

	@Override
	public int tOneCnt(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("tOneline.tOneCnt", params);
	}

	@Override
	public int tOneAdd(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("tOneline.tOneAdd", params);
	}

	@Override
	public int tOneUpdate(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("tOneline.tOneUpdate", params);
	}

	@Override
	public int tOneDelete(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("tOneline.tOneDelete", params);
	}

	@Override
	public int tOneReple(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("tOneline.tOneReple", params);
	}

	@Override
	public int tOneRepleDelete(HashMap<String, String> params) throws Throwable {
	
		return sqlSession.update("tOneline.tOneRepleDelete", params);
	}

	@Override
	public int repleQCnt(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("tOneline.repleQCnt", params);
	}

	@Override
	public int repleUpdateQ(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("tOneline.repleUpdateQ", params);
	}

}
