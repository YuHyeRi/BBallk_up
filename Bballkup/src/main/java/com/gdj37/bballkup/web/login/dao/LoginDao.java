package com.gdj37.bballkup.web.login.dao;

import java.util.HashMap;
import java.util.List;

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

	@Override
	public int pwUpdateMem(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("login.pwUpdateMem", params);
	}

	@Override
	public HashMap<String, String> getMemFindId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMemFindId", params);
	}

	@Override
	public int getMemFindIdCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMemFindIdCnt", params);
	}

	@Override
	public int getMemIdCntCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMemIdCntCheck", params);
	}

	@Override
	public HashMap<String, String> getMemPwAllCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMemPwAllCheck", params);
	}

	@Override
	public int getMemNoCntCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getMemNoCntCheck", params);
	}

	@Override
	public int getAllBoardCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("login.getAllBoardCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getAllBoardList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("login.getAllBoardList", params);
	}

	@Override
	public List<HashMap<String, String>> getTeamJoin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("login.getTeamJoin", params);
	}

}
