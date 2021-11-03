package com.gdj37.bballkup.web.teamAdd.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.teamAdd.dao.ITeamAddDao;



@Service
public class TeamAddService implements ITeamAddService {
	@Autowired
	public ITeamAddDao iTeamAddDao;

	@Override
	public int teamChk(HashMap<String, String> params) throws Throwable {
		
		return iTeamAddDao.teamChk(params);
	}
	
	@Override
	public int teamAdd(HashMap<String, String> params) throws Throwable {
		
		return iTeamAddDao.teamAdd(params);
	}

	@Override
	public int tNmChk(HashMap<String, String> params) throws Throwable {
		
		return iTeamAddDao.tNmChk(params);
	}

}
