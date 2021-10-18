package com.gdj37.bballkup.web.login.service;

import java.util.HashMap;

public interface ILoginService {

	public HashMap<String, String> getLogin(HashMap<String, String> params) throws Throwable;

	public int getMemIdCheck(HashMap<String, String> params) throws Throwable;

}
