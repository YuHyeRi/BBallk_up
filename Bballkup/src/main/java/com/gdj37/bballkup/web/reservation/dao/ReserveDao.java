package com.gdj37.bballkup.web.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDao implements IReserveDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int matchAdd(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("match.matchAdd", params);
	}

	@Override
	public int getMatchCnt(HashMap<String, String> params) throws Throwable {
		
		return sqlSession.selectOne("match.getMatchCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getMatchList(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectList("match.getMatchList", params);
	}

	@Override
	public HashMap<String, String> getMatch(HashMap<String, String> params) throws Throwable {

		return sqlSession.selectOne("match.getMatch", params);
	}
}
