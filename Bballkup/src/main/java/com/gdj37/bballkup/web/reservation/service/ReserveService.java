package com.gdj37.bballkup.web.reservation.service;

import java.util.HashMap;

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
	
}
