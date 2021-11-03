package com.gdj37.bballkup.web.myPage.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDao implements IMyPageDao{
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getMEM(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("myPage.getMEM", params);
	}

	@Override
	public int getCardChk(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("myPage.getCardChk", params);
	}

	@Override
	public HashMap<String, String> getCard(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("myPage.getCard", params);
	}

	@Override
	public int addCard(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("myPage.addCard", params);
	}

	@Override
	public int deleteCard(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.delete("myPage.deleteCard", params);
	}

	@Override
	public int getMemCnt(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("myPage.getMemCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getMemList(HashMap<String, String> params) {
		
		return sqlSession.selectList("myPage.getMemList", params);
	}

	@Override
	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("myPage.getTeamList", params);
	}
}
