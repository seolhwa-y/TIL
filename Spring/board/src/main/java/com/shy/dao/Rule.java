package com.shy.dao;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

public interface Rule {
	public void backController(ModelAndView mav, int code);
	
	public void backController(Model model, int code);
}
