package com.gdj37.bballkup.web.t_board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class T_noticeDao implements IT_noticeDao{
	@Autowired 
	public SqlSession sqlSession;

	@Override
	public int getnoticeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("T_notice.getnoticeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getnoticeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("T_notice.getnoticeList", params);
	}

	@Override
	public void updatenoticeHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("T_notice.updatenoticeHit", params);
	}

	@Override
	public HashMap<String, String> getnoticeDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("T_notice.getnoticeDtl", params);
	}

	@Override
	public int T_noticeAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("T_notice.T_noticeAdd", params);
	}

	@Override
	public int T_noticeUpdate(HashMap<String, String> params) throws Throwable {
		return  sqlSession.update("T_notice.T_noticeUpdate", params);
	}

	@Override
	public int T_noticeDeletes(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("T_notice.T_noticeDeletes", params);
	}

	
}
