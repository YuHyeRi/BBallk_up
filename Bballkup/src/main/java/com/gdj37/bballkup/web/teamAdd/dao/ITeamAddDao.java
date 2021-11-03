package com.gdj37.bballkup.web.teamAdd.dao;

import java.util.HashMap;

public interface ITeamAddDao {

	public int teamAdd(HashMap<String, String> params) throws Throwable;

	public int teamChk(HashMap<String, String> params) throws Throwable;

	public int tNmChk(HashMap<String, String> params) throws Throwable;

}
