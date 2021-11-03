package com.gdj37.bballkup.web.reservation.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.reservation.dao.IReserveDao;


@Service
public class ReserveService implements IReserveService{
	@Autowired
	public IReserveDao iReserveDao;

	@Override
	public int matchAdd(HashMap<String, String> params) throws Throwable {
		
		return iReserveDao.matchAdd(params);
	}

	@Override
	public int getMatchCnt(HashMap<String, String> params) throws Throwable {
		
		return iReserveDao.getMatchCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getMatchList(HashMap<String, String> params) throws Throwable {

		return iReserveDao.getMatchList(params);
	}

	@Override
	public HashMap<String, String> getMatch(HashMap<String, String> params) throws Throwable {

		return iReserveDao.getMatch(params);
	}
	
}
