package com.gdj37.bballkup.web.myPage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.myPage.dao.IMyPageDao;



@Service
public class MyPageService implements IMyPageService{
	
	@Autowired
	public IMyPageDao iMyPageDao;

	@Override
	public HashMap<String, String> getMEM(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.getMEM(params);
	}

	@Override
	public int getCardChk(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.getCardChk(params);
	}

	@Override
	public HashMap<String, String> getCard(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.getCard(params);
	}

	@Override
	public int addCard(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.addCard(params);
	}

	@Override
	public int deleteCard(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.deleteCard(params);
	}

	@Override
	public int getMemCnt(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.getMemCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getMemList(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.getMemList(params);
	}

	@Override
	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable {
		
		return iMyPageDao.getTeamList(params);
	}

	@Override
	public List<HashMap<String, String>> teamManageList(HashMap<String, String> params) throws Throwable {
		return iMyPageDao.teamManageList(params);
	}

	@Override
	public int teamManageUpdate(HashMap<String, String> params) throws Throwable {
		return iMyPageDao.teamManageUpdate(params);
	}

}
