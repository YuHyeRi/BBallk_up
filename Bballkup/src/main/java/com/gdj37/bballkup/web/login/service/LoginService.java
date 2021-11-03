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

	@Override
	public int pwUpdateMem(HashMap<String, String> params) throws Throwable {
		return iLoginDao.pwUpdateMem(params);
	}

	@Override
	public HashMap<String, String> getMemFindId(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMemFindId(params);
	}

	@Override
	public int getMemFindIdCnt(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMemFindIdCnt(params);
	}

	@Override
	public int getMemIdCntCheck(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMemIdCntCheck(params);
	}

	@Override
	public HashMap<String, String> getMemPwAllCheck(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMemPwAllCheck(params);
	}

	@Override
	public int getMemNoCntCheck(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMemNoCntCheck(params);
	}

	@Override
	public int getAllBoardCnt(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getAllBoardCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getAllBoardList(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getAllBoardList(params);
	}

	@Override
	public List<HashMap<String, String>> getTeamJoin(HashMap<String, String> params) throws Throwable {
		
		return iLoginDao.getTeamJoin(params);
	}

	@Override
	public List<HashMap<String, String>> getMatchList(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMatchList(params);
	}

	@Override
	public HashMap<String, String> getAttend(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getAttend(params);
	}

	@Override
	public int getMatchCnt(HashMap<String, String> params) throws Throwable {
		return iLoginDao.getMatchCnt(params);
	}

	
}
