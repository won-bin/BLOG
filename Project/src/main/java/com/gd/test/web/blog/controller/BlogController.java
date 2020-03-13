package com.gd.test.web.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.test.common.bean.PagingBean;
import com.gd.test.common.service.IPagingService;
import com.gd.test.util.Utils;
import com.gd.test.web.blog.service.IBlogService;

@Controller
public class BlogController {
	@Autowired
	public IBlogService iBlogService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/main")
	public ModelAndView main(@RequestParam HashMap<String, String> params,
			ModelAndView mav, HttpSession session) throws Throwable {
		
		if(params.get("bmNo") != null) {
			session.setAttribute("bmNo", params.get("bmNo"));
		}
		
		mav.addObject("bNo", params.get("bNo"));
		mav.setViewName("blog/main");
		
		return mav;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView login(ModelAndView mav) {
		mav.setViewName("blog/login");
		
		return mav;
	}
	
	@RequestMapping(value="/join")
	public ModelAndView join(ModelAndView mav) {
		mav.setViewName("blog/join");
		
		return mav;
	}
	
	@RequestMapping(value="/joinAjax", method = RequestMethod.POST,
				   produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String joinAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			//비밀번호 암호화
			params.put("joinPw", Utils.encryptAES128(params.get("joinPw")));
			
			iBlogService.insertM(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/loginAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loginAjax(@RequestParam HashMap<String, String> params,
							 HttpSession session,
							 ModelAndView mav) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("loginPw", Utils.encryptAES128(params.get("loginPw")));
		
		HashMap<String, String> data = iBlogService.getM(params);
		if(data != null) { 
			session.setAttribute("sBmNo", data.get("BM_NO"));
			session.setAttribute("sBmNm", data.get("NAME"));
			session.setAttribute("sBmId", data.get("ID"));
			session.setAttribute("sBmBn", data.get("BLOG_NAME"));
			  
			modelMap.put("res", "SUCCESS"); 
		} else { 
			modelMap.put("res", "FAILED"); 
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/list")
	public ModelAndView list(ModelAndView mav,
							 HttpSession session) {
		mav.setViewName("blog/list");
		
		return mav;
	}
	
	@RequestMapping(value="/mInfoEdit")
	public ModelAndView mInfo(ModelAndView mav,
							  HttpSession session) {
		mav.setViewName("blog/mInfoEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/mLogout")
	public ModelAndView mLogout(HttpSession session,
								 ModelAndView mav) throws Throwable{
		
		session.removeAttribute("sBmNo");
		session.removeAttribute("sBmNm");
		session.removeAttribute("sBmId");
		session.removeAttribute("sBmBn");
		
		mav.setViewName("redirect:list");
		
		return mav;
	}
	
	@RequestMapping(value="/exitAjax", method = RequestMethod.POST,
			   produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String exitAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBlogService.exit(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/editAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String editAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav, HttpSession session) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBlogService.mEdit(params);
			
			HashMap<String, String> data = iBlogService.getEditM(params);
			
			session.setAttribute("sBmNm", data.get("NAME"));
			session.setAttribute("sBmBn", data.get("BLOG_NAME"));
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/write")
	public ModelAndView write(ModelAndView mav) {
		
		mav.setViewName("blog/write");
		
		return mav;
	}
	
	@RequestMapping(value="/bEdit")
	public ModelAndView bEdit(@RequestParam HashMap<String, String> params,
							  ModelAndView mav) {
		
		
		mav.addObject("bNo", params.get("bNo"));
		mav.addObject("bTitle", params.get("bTitle"));
		mav.addObject("bCon", params.get("bCon"));
		
		mav.setViewName("blog/bEdit");
		return mav;
	}
	
	@RequestMapping(value="/bEditAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bEditAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav, HttpSession session) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iBlogService.bEdit(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/pwEditAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String pwEditAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			params.put("bmPw", Utils.encryptAES128(params.get("bmPw")));
			
			iBlogService.pwEdit(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/writeAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String writeAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBlogService.write(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/listAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBlogService.getBCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 5, 10);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iBlogService.getB(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/lastDetailAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String lastDetailAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iBlogService.getLastB(params);
		
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/detailAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String detailAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iBlogService.getOneB(params);
		
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/commentWriteAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentWriteAjax(@RequestParam HashMap<String, String> params,
								   ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iBlogService.insertCMT(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/commentAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentAjax(@RequestParam HashMap<String, String> params,
							  ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iBlogService.getCmt(params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/commentDelAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commentDelAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iBlogService.delCmt(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/menuEdit")
	public ModelAndView menuEdit(ModelAndView mav) {
		
		mav.setViewName("blog/menuEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/bDelAjax", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bDelAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iBlogService.bDel(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getBlogAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBlogAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iBlogService.getBlog(params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getCtgAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getCtgAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = iBlogService.getCtg(params);
		int cnt = iBlogService.getBCnt(params);
		
		modelMap.put("list", list);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/insertCtgAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertCtgAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iBlogService.insertCtg(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/delCtgAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delCtgAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iBlogService.delCtg(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getBlogNmAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBlogNmAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iBlogService.getBlogNm(params);
		
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getBlogCtgAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBlogCtgAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List <HashMap<String, String>> list = iBlogService.getBlogCtg(params);
		
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/joinIdCheckAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String joinIdCheckAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iBlogService.idCheck(params);
		
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
}
