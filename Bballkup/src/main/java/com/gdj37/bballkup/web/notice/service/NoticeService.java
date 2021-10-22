package com.gdj37.bballkup.web.notice.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.bballkup.web.notice.dao.INoticeDao;

@Service
public class NoticeService implements INoticeService{
	@Autowired
	public INoticeDao iNoticeDao;

	@Override
	public int getNoticeCnt(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNoticeCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNoticeList(params);
	}

	@Override
	public void updateNoticeHit(HashMap<String, String> params) throws Throwable {
		iNoticeDao.updateNoticeHit(params);
	}

	@Override
	public HashMap<String, String> getNotice(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNotice(params);
	}

	@Override
	public int NoticeAdd(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.NoticeAdd(params);
	}

	@Override
	public int NoticeUpdate(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.NoticeUpdate(params);
	}

	@Override
	public int NoticeDeletes(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.NoticeDeletes(params);
	}

}
