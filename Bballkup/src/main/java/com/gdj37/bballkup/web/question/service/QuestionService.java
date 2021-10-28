package com.gdj37.bballkup.web.question.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.question.dao.IQuestionDao;

@Service
public class QuestionService implements IQuestionService{
	
	@Autowired
	public IQuestionDao iQuestionDao;

	@Override
	public List<HashMap<String, String>> getQList(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.getQList(params);
	}

	@Override
	public int getQCnt(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.getQCnt(params);
	}

	@Override
	public int addQ(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.addQ(params);
	}

	@Override
	public int updateQ(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.updateQ(params);
	}

	@Override
	public int deleteQ(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.deleteQ(params);
	}

	@Override
	public int repleQ(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.repleQ(params);
	}

	@Override
	public int repleDeleteQ(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.repleDeleteQ(params);
	}

	@Override
	public int repleQCnt(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.repleQCnt(params);
	}

	@Override
	public int repleUpdateQ(HashMap<String, String> params) throws Throwable {
		
		return iQuestionDao.repleUpdateQ(params);
	}


}