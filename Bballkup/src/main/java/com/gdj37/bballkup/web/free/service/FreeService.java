package com.gdj37.bballkup.web.free.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.free.dao.IFreeDao;

@Service
public class FreeService implements IFreeService {
	
	@Autowired
	public IFreeDao iFreeDao;
	

	@Override
	public int getFreeCnt(HashMap<String, String> params) throws Throwable {
		return iFreeDao.getFreeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getFreeList(HashMap<String, String> params) throws Throwable {
		return iFreeDao.getFreeList(params);
	}

	@Override
	public int freeAdd(HashMap<String, Object> params) throws Throwable {
		return iFreeDao.freeAdd(params);
	}

	@Override
	public void updateFreeHit(HashMap<String, String> params) throws Throwable {
		iFreeDao.updateFreeHit(params);
	}

	@Override
	public HashMap<String, String> getFree(HashMap<String, String> params) throws Throwable {
		return iFreeDao.getFree(params);
	}

	@Override
	public int freeDelete(HashMap<String, String> params) throws Throwable {
		return iFreeDao.freeDelete(params);
	}

	@Override
	public int freeUpdate(HashMap<String, String> params) throws Throwable {
		return iFreeDao.freeUpdate(params);
	}

	// 댓글부분
	@Override
	public int cfreeCnt(HashMap<String, String> params) throws Throwable {
		return iFreeDao.cfreeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> cfreeList(HashMap<String, String> params) throws Throwable {
		return iFreeDao.cfreeList(params);
	}

	@Override
	public int cfreeAdd(HashMap<String, Object> params) throws Throwable {
		return iFreeDao.cfreeAdd(params);
	}

	@Override
	public int cfreeDel(HashMap<String, String> params) throws Throwable {
		return iFreeDao.cfreeDel(params);
	}

	@Override
	public int cfreeUpdate(HashMap<String, String> params) throws Throwable {
		return iFreeDao.cfreeUpdate(params);
	}


	

} // class end
