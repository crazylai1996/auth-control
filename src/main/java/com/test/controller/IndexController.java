package com.test.controller;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.test.service.UserService;

@Controller
public class IndexController {
	
	@RequestMapping(value={"/","/index"})
	public ModelAndView index(){
		ModelAndView mov=new ModelAndView("index");
		
		return mov;
	}
}
