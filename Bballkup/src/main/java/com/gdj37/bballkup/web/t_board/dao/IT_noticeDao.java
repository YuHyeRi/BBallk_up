package com.gdj37.bballkup.web.t_board.dao;

import java.util.HashMap;
import java.util.List;

public interface IT_noticeDao {

	public int getnoticeCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getnoticeList(HashMap<String, String> params) throws Throwable;

}
