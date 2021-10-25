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
}
