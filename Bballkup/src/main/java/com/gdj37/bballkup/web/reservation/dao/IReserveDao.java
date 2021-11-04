package com.gdj37.bballkup.web.reservation.dao;

import java.util.HashMap;
import java.util.List;

public interface IReserveDao {

	public int matchAdd(HashMap<String, String> params) throws Throwable;

	public int getMatchCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMatchList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMatch(HashMap<String, String> params) throws Throwable;

	public int getCard(HashMap<String, String> params) throws Throwable;

	public int attend(HashMap<String, String> params) throws Throwable;

	public int getAtt(HashMap<String, String> params) throws Throwable;

}
