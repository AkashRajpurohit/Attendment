package com.attendment.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.attendment.beans.Student;
import com.attendment.service.AttendmentService;

@Controller
public class AdminController {
	
	@Autowired
	public AttendmentService service;
	
	ArrayList<Student> list;
	@CrossOrigin
	@RequestMapping("/")
	public ModelAndView showIndex(ModelAndView mav) {
		mav.setViewName("index");
		list = service.getAllStudent();
		mav.addObject("list", list);
		return mav;
	}
}
