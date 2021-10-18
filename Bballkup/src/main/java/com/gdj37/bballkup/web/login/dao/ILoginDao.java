package com.gdj37.bballkup.web.login.dao;

import java.util.HashMap;

public interface ILoginDao {

	public HashMap<String, String> getLogin(HashMap<String, String> params) throws Throwable;

	public int getMemIdCheck(HashMap<String, String> params) throws Throwable;

}
