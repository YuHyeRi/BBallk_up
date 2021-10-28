package com.gdj37.bballkup.web.question.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDao implements IQuestionDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getQList(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectList("question.getQList", params);
	}

	@Override
	public int getQCnt(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("question.getQCnt", params);
	}

	@Override
	public int addQ(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.insert("question.addQ", params);
	}

	@Override
	public int updateQ(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("question.updateQ", params);
	}

	@Override
	public int deleteQ(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("question.deleteQ", params);
	}

	@Override
	public int repleQ(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("question.repleQ", params);
	}

	@Override
	public int repleDeleteQ(HashMap<String, String> params) throws Throwable {
	
		return sqlSession.update("question.repleDeleteQ", params);
	}

	@Override
	public int repleQCnt(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("question.repleQCnt", params);
	}

	@Override
	public int repleUpdateQ(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.update("question.repleUpdateQ", params);
	}

	
}
