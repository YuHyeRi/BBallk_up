package com.gdj37.bballkup.web.login.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.login.dao.ILoginDao;

@Service
public class LoginService implements ILoginService {

	@Autowired
	public ILoginDao iLoginDao;

	@Override
	public HashMap<String, String> getLogin(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getLogin(params);
	}

	@Override
	public int getMemIdCheck(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMemIdCheck(params);
	}

	@Override
	public int joinMem(HashMap<String, String> params) throws Throwable {
		return iLoginDao.joinMem(params);
	}

	@Override
	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMem(params);
	}

	@Override
	public int updateMem(HashMap<String, String> params) throws Throwable {
		return iLoginDao.updateMem(params);
	}

	@Override
	public int deleteMem(HashMap<String, String> params) throws Throwable {
		return iLoginDao.deleteMem(params);
	}

	
}
