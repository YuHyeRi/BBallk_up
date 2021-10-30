package com.gdj37.bballkup.web.main.dao;

import java.util.HashMap;
import java.util.List;

public interface IMainDao {

	public List<HashMap<String, String>> getMain1List(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMain2List(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMain3List(HashMap<String, String> params) throws Throwable;


}
