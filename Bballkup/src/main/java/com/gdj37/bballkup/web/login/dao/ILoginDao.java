package com.gdj37.bballkup.web.login.dao;

import java.util.HashMap;
import java.util.List;

public interface ILoginDao {


	public HashMap<String, String> getLogin(HashMap<String, String> params) throws Throwable;

	public int getMemIdCheck(HashMap<String, String> params) throws Throwable;

	public int joinMem(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMem(HashMap<String, String> params) throws Throwable;

	public int updateMem(HashMap<String, String> params) throws Throwable;

	public int deleteMem(HashMap<String, String> params) throws Throwable;

	public int pwUpdateMem(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMemFindId(HashMap<String, String> params) throws Throwable;

	public int getMemFindIdCnt(HashMap<String, String> params) throws Throwable;

	public int getMemIdCntCheck(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMemPwAllCheck(HashMap<String, String> params) throws Throwable;

	public int getMemNoCntCheck(HashMap<String, String> params) throws Throwable;

	public int getAllBoardCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAllBoardList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTeamJoin(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMatchList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getAttend(HashMap<String, String> params) throws Throwable;

	public int getMatchCnt(HashMap<String, String> params) throws Throwable;
	
}
