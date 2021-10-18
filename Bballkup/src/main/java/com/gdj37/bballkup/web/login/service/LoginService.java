package com.gdj37.bballkup.web.login.service;

import java.util.HashMap;

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
	
	
	
	
	
	
}
