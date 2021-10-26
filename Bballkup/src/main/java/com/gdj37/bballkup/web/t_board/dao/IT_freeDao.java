package com.gdj37.bballkup.web.t_board.dao;

import java.util.HashMap;
import java.util.List;

public interface IT_freeDao {

	public List<HashMap<String, String>> tFreeList(HashMap<String, String> params) throws Throwable;

	public int tFreeCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> tFree(HashMap<String, String> params) throws Throwable;

	public Object tFreeHit(HashMap<String, String> params) throws Throwable;

	public int tFreeAdd(HashMap<String, Object> params) throws Throwable;

	public int tFreeDelete(HashMap<String, String> params) throws Throwable;

	public int tFreeUpdate(HashMap<String, String> params) throws Throwable;

	// 댓글
	public List<HashMap<String, String>> cTFreeList(HashMap<String, String> params) throws Throwable;

	public int cTFreeCnt(HashMap<String, String> params) throws Throwable;

	public int cTfreeAdd(HashMap<String, String> params) throws Throwable;

	public int cTfreeDel(HashMap<String, String> params) throws Throwable;

	public int cTfreeUpdate(HashMap<String, String> params) throws Throwable;

}
