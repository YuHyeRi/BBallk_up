package com.gdj37.bballkup.web.free.dao;

import java.util.HashMap;
import java.util.List;

public interface IFreeDao {

	public int getFreeCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getFreeList(HashMap<String, String> params) throws Throwable;

	public int freeAdd(HashMap<String, Object> params) throws Throwable;

	public Object updateFreeHit(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getFree(HashMap<String, String> params) throws Throwable;

	public int freeDelete(HashMap<String, String> params) throws Throwable;

	public int freeUpdate(HashMap<String, String> params) throws Throwable;

	// 댓글부분
	public int cfreeCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> cfreeList(HashMap<String, String> params) throws Throwable;

	public int cfreeAdd(HashMap<String, Object> params) throws Throwable;

	public int cfreeDel(HashMap<String, String> params) throws Throwable;

	public int cfreeUpdate(HashMap<String, String> params) throws Throwable;



}
