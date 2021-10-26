package com.gdj37.bballkup.web.free.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeDao implements IFreeDao {
	
	@Autowired
	public SqlSession session;

	@Override
	public int getFreeCnt(HashMap<String, String> params) throws Throwable {
		return session.selectOne("free.getFreeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getFreeList(HashMap<String, String> params) throws Throwable {
		return session.selectList("free.getFreeList", params);
	}

	@Override
	public int freeAdd(HashMap<String, Object> params) throws Throwable {
		return session.insert("free.freeAdd", params);
	}

	@Override
	public Object updateFreeHit(HashMap<String, String> params) throws Throwable {
		return session.update("free.updateFreeHit", params);
	}

	@Override
	public HashMap<String, String> getFree(HashMap<String, String> params) throws Throwable {
		return session.selectOne("free.getFree", params);
	}

	@Override
	public int freeDelete(HashMap<String, String> params) throws Throwable {
		return session.update("free.freeDelete", params);
	}

	@Override
	public int freeUpdate(HashMap<String, String> params) throws Throwable {
		return session.update("free.freeUpdate", params);
	}

	// 댓글부분
	@Override
	public int cfreeCnt(HashMap<String, String> params) throws Throwable {
		return session.selectOne("cfree.cfreeCnt", params);
	}

	@Override
	public List<HashMap<String, String>> cfreeList(HashMap<String, String> params) throws Throwable {
		return session.selectList("cfree.cfreeList", params);
	}

	@Override
	public int cfreeAdd(HashMap<String, Object> params) throws Throwable {
		return session.insert("cfree.cfreeAdd", params);
	}

	@Override
	public int cfreeDel(HashMap<String, String> params) throws Throwable {
		return session.update("cfree.cfreeDel", params);
	}

	@Override
	public int cfreeUpdate(HashMap<String, String> params) throws Throwable {
		return session.update("cfree.cfreeUpdate", params);
	}



} // class end
