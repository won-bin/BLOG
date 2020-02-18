package com.gd.test.web.blog.dao;

import java.util.HashMap;
import java.util.List;

public interface IBlogDao {

	public void insertM(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getM(HashMap<String, String> params) throws Throwable;

	public void exit(HashMap<String, String> params)throws Throwable;

	public void mEdit(HashMap<String, String> params) throws Throwable;

	public void pwEdit(HashMap<String, String> params) throws Throwable;

	public void write(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getB(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getLastB(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getOneB(HashMap<String, String> params) throws Throwable;

	public void insertCMT(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmt(HashMap<String, String> params) throws Throwable;

	public void delCmt(HashMap<String, String> params) throws Throwable;

	public int getBCnt(HashMap<String, String> params)throws Throwable;

	public void bDel(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getEditM(HashMap<String, String> params) throws Throwable;

	public void bEdit(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBlog(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCtg(HashMap<String, String> params) throws Throwable;

	public void insertCtg(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBlogNm(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBlogCtg(HashMap<String, String> params) throws Throwable;

	public void delCtg(HashMap<String, String> params) throws Throwable;

}
