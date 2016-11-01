package kr.ac.sungkyul.upa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.upa.service.MapService;
import kr.ac.sungkyul.upa.vo.MapVo;

@Controller
public class MainController {
	
	
	@Autowired
	MapService mapservice;
	
	@RequestMapping("/main")
	public String index(Model model){
		
	    //지도 리스트
		List<MapVo> list= mapservice.mapmainlist();
		model.addAttribute("list",list);
		return "main/index";
	}
}
