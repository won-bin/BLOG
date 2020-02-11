package com.gd.test.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
public class CommonAOP {
	@Pointcut("execution(* com.gd.test..TestController2.*(..))" 
			+ "&&!execution(* com.gd.test..TestController2.*Ajax(..))"
			+ "&&!execution(* com.gd.test..TestController2.*Log*(..))"
			+ "&&!execution(* com.gd.test..TestController2.*Join(..))"
			+ "&&!execution(* com.gd.test..TestController2.*List(..))"
			+ "&&!execution(* com.gd.test..TestController2.*Detail(..))")
	public void aLoginCheckAOP() {
		
	}
	
	@Around("aLoginCheckAOP()")
	public ModelAndView aLoginCheckAOP(ProceedingJoinPoint joinPoint) throws Throwable {
		ModelAndView mav = new ModelAndView();
		
		//Request 객체 취득
		HttpServletRequest request
		= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		
		//Session 취득
		HttpSession session = request.getSession();
		
		if(session.getAttribute("sBmNo") != null) {
			mav = (ModelAndView) joinPoint.proceed();
		} else {
			mav.setViewName("redirect:aLogin");
		}
		
		System.out.println("------ aLoginCheckAOP 실행됨 ------");
		
		return mav;
	}
}
