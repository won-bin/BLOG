package com.gd.test.web.blog.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BlogDao implements IBlogDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void insertM(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertM", params);
	}

	@Override
	public HashMap<String, String> getM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getM", params);
	}

	@Override
	public void exit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.exit", params);
	}

	@Override
	public void mEdit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.mEdit", params);
	}

	@Override
	public void pwEdit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.pwEdit", params);
	}

	@Override
	public void write(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.write", params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getB", params);
	}

	@Override
	public HashMap<String, String> getLastB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getLastB", params);
	}

	@Override
	public HashMap<String, String> getOneB(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getOneB", params);
	}

	@Override
	public void insertCMT(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertCMT", params);
	}

	@Override
	public List<HashMap<String, String>> getCmt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getCMT", params);
	}

	@Override
	public void delCmt(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("blog.delCMT", params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBCnt", params);
	}

	@Override
	public void bDel(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("blog.bDel", params);
	}

	@Override
	public HashMap<String, String> getEditM(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getEditM", params);
	}

	@Override
	public void bEdit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("blog.bEdit", params);
	}

	@Override
	public List<HashMap<String, String>> getBlog(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getBlog", params);
	}

	@Override
	public List<HashMap<String, String>> getCtg(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getCtg", params);
	}

	@Override
	public void insertCtg(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("blog.insertCtg", params);
	}

	@Override
	public HashMap<String, String> getBlogNm(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.getBlogNm", params);
	}

	@Override
	public List<HashMap<String, String>> getBlogCtg(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("blog.getBlogCtg", params);
	}

	@Override
	public void delCtg(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("blog.delCtg", params);
	}

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("blog.idCheck", params);
	}
	
}
