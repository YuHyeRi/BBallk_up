package com.gdj37.bballkup.web.main.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.main.dao.IMainDao;

@Service
public class MainService implements IMainService{
	@Autowired
	public IMainDao iMainDao;

	@Override
	public List<HashMap<String, String>> getMain1List(HashMap<String, String> params) throws Throwable {
		return iMainDao.getMain1List(params);
	}

	@Override
	public List<HashMap<String, String>> getMain2List(HashMap<String, String> params) throws Throwable {
		return iMainDao.getMain2List(params);
	}

	@Override
	public List<HashMap<String, String>> getMain3List(HashMap<String, String> params) throws Throwable {
		return iMainDao.getMain3List(params);
	}
	
}
