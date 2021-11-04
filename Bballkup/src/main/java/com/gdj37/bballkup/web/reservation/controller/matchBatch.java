package com.gdj37.bballkup.web.reservation.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.gdj37.bballkup.web.reservation.dao.IReserveDao;

@Component
public class matchBatch {

	@Autowired
	public IReserveDao iReserveDao;
	
	@Scheduled(cron = "0 0 0 * * *")
	public void stateChange() throws Throwable {
		
		iReserveDao.stateChange();
	}
}
