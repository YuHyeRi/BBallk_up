package com.gdj37.bballkup.web.t_board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class T_freeDao implements IT_freeDao {
	
	@Autowired
	public SqlSession session;

	@Override
	public List<HashMap<String, String>> tFreeList(HashMap<String, String> params) throws Throwable {
		return session.selectList("tFree.tFreeList", params);
	}

	@Override
	public int tFreeCnt(HashMap<String, String> params) throws Throwable {
		return session.selectOne("tFree.tFreeCnt", params);
	}

	@Override
	public HashMap<String, String> tFree(HashMap<String, String> params) throws Throwable {
		return session.selectOne("tFree.tFree", params);
	}

	@Override
	public Object tFreeHit(HashMap<String, String> params) throws Throwable {
		return session.update("tFree.tFreeHit", params);
	}

	@Override
	public int tFreeAdd(HashMap<String, Object> params) throws Throwable {
		return session.insert("tFree.tFreeAdd", params);
	}

	@Override
	public int tFreeDelete(HashMap<String, String> params) throws Throwable {
		return session.update("tFree.tFreeDelete", params);
	}

	@Override
	public int tFreeUpdate(HashMap<String, String> params) throws Throwable {
		return session.update("tFree.tFreeUpdate", params);
	}

	// 댓글
	@Override
	public List<HashMap<String, String>> cTFreeList(HashMap<String, String> params) throws Throwable {
		return session.selectList("tFreeC.cTFreeList", params);
	}

	@Override
	public int cTFreeCnt(HashMap<String, String> params) throws Throwable {
		return session.selectOne("tFreeC.cTFreeCnt", params);
	}

	@Override
	public int cTfreeAdd(HashMap<String, String> params) throws Throwable {
		return session.insert("tFreeC.cTfreeAdd", params);
	}

	@Override
	public int cTfreeDel(HashMap<String, String> params) throws Throwable {
		return session.update("tFreeC.cTfreeDel", params);
	}

	@Override
	public int cTfreeUpdate(HashMap<String, String> params) throws Throwable {
		return session.update("tFreeC.cTfreeUpdate", params);
	}


} // class end
