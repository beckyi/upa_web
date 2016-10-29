package kr.ac.sungkyul.upa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.upa.vo.MapVo;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@RequestMapping("/requestparkform")
	public String requestparkform(){
		return "map/requestParkform";
	}
	
	@RequestMapping("/requestpark")
	public void requestpark(MapVo mapvo){
		System.out.println(mapvo.toString());
	}

}
