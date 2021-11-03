package com.gdj37.bballkup.web.myPage.dao;

import java.util.HashMap;
import java.util.List;

public interface IMyPageDao {

	public HashMap<String, String> getMEM(HashMap<String, String> params) throws Throwable;

	public int getCardChk(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCard(HashMap<String, String> params) throws Throwable;

	public int addCard(HashMap<String, String> params) throws Throwable;

	public int deleteCard(HashMap<String, String> params) throws Throwable;

	public int getMemCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMemList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> teamManageList(HashMap<String, String> params) throws Throwable;

	public int teamManageUpdate(HashMap<String, String> params) throws Throwable;
}
