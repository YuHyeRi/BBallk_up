package com.gdj37.bballkup.web.team.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.team.dao.ITMainDao;

@Service
public class TMainService implements ITMainService {
	
	@Autowired
	public ITMainDao iTMainDao;

	@Override
	public List<HashMap<String, String>> tMainList(HashMap<String, String> params) throws Throwable {
		return iTMainDao.tMainList(params);
	}

	@Override
	public HashMap<String, String> tMainDtl(HashMap<String, String> params) throws Throwable {
		return iTMainDao.tMainDtl(params);
	}

	@Override
	public int teamReg(HashMap<String, String> params) throws Throwable {
		return iTMainDao.teamReg(params);
	}

	@Override
	public int teamRegOX(HashMap<String, String> params) throws Throwable {
		return iTMainDao.teamRegOX(params);
	}

	@Override
	public int applyState(HashMap<String, String> params) throws Throwable {
		return iTMainDao.applyState(params);
	}

	@Override
	public List<HashMap<String, String>> tMemManageList(HashMap<String, String> params) throws Throwable {
		return iTMainDao.tMemManageList(params);
	}


} // class end