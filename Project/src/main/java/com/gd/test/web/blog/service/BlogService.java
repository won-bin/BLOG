package com.gd.test.web.blog.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.test.web.blog.dao.IBlogDao;

@Service
public class BlogService implements IBlogService{
	@Autowired
	public IBlogDao iBlogDao;
	
	@Override
	public void insertM(HashMap<String, String> params) throws Throwable{
		iBlogDao.insertM(params);
	}

	@Override
	public HashMap<String, String> getM(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getM(params);
	}

	@Override
	public void exit(HashMap<String, String> params) throws Throwable {
		iBlogDao.exit(params);
	}

	@Override
	public void mEdit(HashMap<String, String> params) throws Throwable {
		iBlogDao.mEdit(params);
	}

	@Override
	public void pwEdit(HashMap<String, String> params) throws Throwable {
		iBlogDao.pwEdit(params);
	}

	@Override
	public void write(HashMap<String, String> params) throws Throwable {
		iBlogDao.write(params);
	}

	@Override
	public List<HashMap<String, String>> getB(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getB(params);
	}

	@Override
	public HashMap<String, String> getLastB(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getLastB(params);
	}

	@Override
	public HashMap<String, String> getOneB(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getOneB(params);
	}

	@Override
	public void insertCMT(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertCMT(params);
	}

	@Override
	public List<HashMap<String, String>> getCmt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCmt(params);
	}

	@Override
	public void delCmt(HashMap<String, String> params) throws Throwable{
		iBlogDao.delCmt(params);
	}

	@Override
	public int getBCnt(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBCnt(params);
	}

	@Override
	public void bDel(HashMap<String, String> params) throws Throwable {
		iBlogDao.bDel(params);
	}

	@Override
	public HashMap<String, String> getEditM(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getEditM(params);
	}

	@Override
	public void bEdit(HashMap<String, String> params) throws Throwable {
		iBlogDao.bEdit(params);
	}

	@Override
	public List<HashMap<String, String>> getBlog(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlog(params);
	}

	@Override
	public List<HashMap<String, String>> getCtg(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getCtg(params);
	}

	@Override
	public void insertCtg(HashMap<String, String> params) throws Throwable {
		iBlogDao.insertCtg(params);
	}

	@Override
	public HashMap<String, String> getBlogNm(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlogNm(params);
	}

	@Override
	public List<HashMap<String, String>> getBlogCtg(HashMap<String, String> params) throws Throwable {
		return iBlogDao.getBlogCtg(params);
	}

	@Override
	public void delCtg(HashMap<String, String> params) throws Throwable {
		iBlogDao.delCtg(params);
	}

	@Override
	public int idCheck(HashMap<String, String> params) throws Throwable {
		return iBlogDao.idCheck(params);
	}

}
