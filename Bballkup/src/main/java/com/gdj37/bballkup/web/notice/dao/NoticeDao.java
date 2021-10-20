package com.gdj37.bballkup.web.notice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao implements INoticeDao{
	@Autowired 
	public SqlSession sqlSession;

	@Override
	public int getNoticeCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Notice.getNoticeCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Notice.getNoticeList",params);
	}

	@Override
	public void updateNoticeHit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Notice.updateNoticeHit", params);
	}

	@Override
	public HashMap<String, String> getNotice(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Notice.getNotice", params);
	}

	@Override
	public int NoticeAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Notice.NoticeAdd", params);
	}

	@Override
	public int NoticeUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Notice.NoticeUpdate", params);
	}

	@Override
	public int NoticeDeletes(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Notice.NoticeDeletes", params);
	}
}
