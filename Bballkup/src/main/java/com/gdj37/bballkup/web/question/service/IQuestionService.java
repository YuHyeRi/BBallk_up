package com.gdj37.bballkup.web.question.service;

import java.util.HashMap;
import java.util.List;

public interface IQuestionService {

	public List<HashMap<String, String>> getQList(HashMap<String, String> params) throws Throwable;

	public int getQCnt(HashMap<String, String> params) throws Throwable;

	public int addQ(HashMap<String, String> params) throws Throwable;

	public int updateQ(HashMap<String, String> params) throws Throwable;

	public int deleteQ(HashMap<String, String> params) throws Throwable;

	public int repleQ(HashMap<String, String> params) throws Throwable;

	public int repleDeleteQ(HashMap<String, String> params) throws Throwable;

	public int repleQCnt(HashMap<String, String> params) throws Throwable;

	public int repleUpdateQ(HashMap<String, String> params) throws Throwable;

}
