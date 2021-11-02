package com.gdj37.bballkup.web.reservation.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReserveDao implements IReserveDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int matchAdd(HashMap<String, String> params) throws Throwable {

		return sqlSession.insert("match.matchAdd", params);
	}
}
