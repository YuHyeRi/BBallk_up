package com.gdj37.bballkup.web.t_board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.t_board.dao.IT_noticeDao;

@Service
public class T_noticeService implements IT_noticeService {
	@Autowired
	public IT_noticeDao iT_noticeDao;

	@Override
	public int getnoticeCnt(HashMap<String, String> params) throws Throwable {
		return iT_noticeDao.getnoticeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getnoticeList(HashMap<String, String> params) throws Throwable {
		return iT_noticeDao.getnoticeList(params);
	}

	@Override
	public void updatenoticeHit(HashMap<String, String> params) throws Throwable {
		iT_noticeDao.updatenoticeHit(params);
	}

	@Override
	public HashMap<String, String> getnoticeDtl(HashMap<String, String> params) throws Throwable {
		return iT_noticeDao.getnoticeDtl(params);
	}

	@Override
	public int T_noticeAdd(HashMap<String, String> params) throws Throwable {
		return iT_noticeDao.T_noticeAdd(params);
	}

	@Override
	public int T_noticeUpdate(HashMap<String, String> params) throws Throwable {
		return iT_noticeDao.T_noticeUpdate(params);
	}

	@Override
	public int T_noticeDeletes(HashMap<String, String> params) throws Throwable {
		return iT_noticeDao.T_noticeDeletes(params);
	}

}
