package com.gdj37.bballkup.web.t_board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.question.dao.IQuestionDao;
import com.gdj37.bballkup.web.t_board.dao.IT_onelineDao;

@Service
public class T_onelineService implements IT_onelineService{
	@Autowired
	public IT_onelineDao it_onelineDao;

	@Override
	public List<HashMap<String, String>> tOneList(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneList(params);
	}

	@Override
	public int tOneCnt(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneCnt(params);
	}

	@Override
	public int tOneAdd(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneAdd(params);
	}

	@Override
	public int tOneUpdate(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneUpdate(params);
	}

	@Override
	public int tOneDelete(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneDelete(params);
	}

	@Override
	public int tOneReple(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneReple(params);
	}

	@Override
	public int tOneRepleDelete(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.tOneRepleDelete(params);
	}

	@Override
	public int repleQCnt(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.repleQCnt(params);
	}

	@Override
	public int repleUpdateQ(HashMap<String, String> params) throws Throwable {
		
		return it_onelineDao.repleUpdateQ(params);
	}

	@Override
	public HashMap<String, String> TeamLeader(HashMap<String, String> params) throws Throwable {
		return it_onelineDao.TeamLeader(params);
	}
}
