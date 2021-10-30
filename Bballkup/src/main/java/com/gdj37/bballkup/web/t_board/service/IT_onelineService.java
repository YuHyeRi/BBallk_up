package com.gdj37.bballkup.web.t_board.service;

import java.util.HashMap;
import java.util.List;

public interface IT_onelineService {

	public List<HashMap<String, String>> tOneList(HashMap<String, String> params) throws Throwable;

	public int tOneCnt(HashMap<String, String> params) throws Throwable;

	public int tOneAdd(HashMap<String, String> params) throws Throwable;

	public int tOneUpdate(HashMap<String, String> params) throws Throwable;

	public int tOneDelete(HashMap<String, String> params) throws Throwable;

	public int tOneReple(HashMap<String, String> params) throws Throwable;

	public int tOneRepleDelete(HashMap<String, String> params) throws Throwable;

	public int repleQCnt(HashMap<String, String> params) throws Throwable;

	public int repleUpdateQ(HashMap<String, String> params) throws Throwable;


}
