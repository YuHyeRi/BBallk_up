package com.gdj37.bballkup.web.team.dao;

import java.util.HashMap;
import java.util.List;

public interface ITMainDao {

	public List<HashMap<String, String>> tMainList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> tMainDtl(HashMap<String, String> params) throws Throwable;

	public int teamReg(HashMap<String, String> params) throws Throwable;

	public int teamRegOX(HashMap<String, String> params) throws Throwable;

	public int applyState(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> tMemManageList(HashMap<String, String> params) throws Throwable;

	public int tMemManageUpdate(HashMap<String, String> params) throws Throwable;

	

}
