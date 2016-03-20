package com.faisal.web.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring security Hello World");
		model.addObject("message", "This is welcome message");
		model.setViewName("hello");

		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {
		ModelAndView model = new ModelAndView();

		model.addObject("title", "Spring Security from admin");
		model.addObject("message", "This is message generated from admin page");

		model.setViewName("admin");

		return model;
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		System.out.println("error=" + error);
		System.out.println("logout=" + logout);
		if (error != null) {
			model.addObject("error", "Invalid username and password");
		}
		if (logout != null) {
			model.addObject("msg", "You have been logged out successfully");
		}

		model.setViewName("login");
		return model;
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		
		if(!(auth instanceof AnonymousAuthenticationToken)){
			UserDetails userDetail=(UserDetails)auth.getPrincipal();
			model.addObject("username",userDetail.getUsername());
		}
		model.setViewName("403");
		return model;

	}

}
