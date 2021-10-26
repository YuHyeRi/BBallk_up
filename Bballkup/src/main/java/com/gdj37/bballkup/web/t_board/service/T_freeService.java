package com.gdj37.bballkup.web.t_board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.t_board.dao.IT_freeDao;

@Service
public class T_freeService implements IT_freeService {
	
	@Autowired
	public IT_freeDao iT_freeDao;

	@Override
	public List<HashMap<String, String>> tFreeList(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.tFreeList(params);
	}

	@Override
	public int tFreeCnt(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.tFreeCnt(params);
	}

	@Override
	public HashMap<String, String> tFree(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.tFree(params);
	}

	@Override
	public void tFreeHit(HashMap<String, String> params) throws Throwable {
		iT_freeDao.tFreeHit(params);
	}

	@Override
	public int tFreeAdd(HashMap<String, Object> params) throws Throwable {
		return iT_freeDao.tFreeAdd(params);
	}

	@Override
	public int tFreeDelete(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.tFreeDelete(params);
	}

	@Override
	public int tFreeUpdate(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.tFreeUpdate(params);
	}

	// 댓글
	@Override
	public List<HashMap<String, String>> cTFreeList(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.cTFreeList(params);
	}

	@Override
	public int cTFreeCnt(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.cTFreeCnt(params);
	}

	@Override
	public int cTfreeAdd(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.cTfreeAdd(params);
	}

	@Override
	public int cTfreeDel(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.cTfreeDel(params);
	}

	@Override
	public int cTfreeUpdate(HashMap<String, String> params) throws Throwable {
		return iT_freeDao.cTfreeUpdate(params);
	}
	

} // class end
