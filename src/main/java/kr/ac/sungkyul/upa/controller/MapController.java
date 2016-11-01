package kr.ac.sungkyul.upa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.upa.service.MapService;
import kr.ac.sungkyul.upa.vo.MapVo;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired MapService mapservice;
	
	@RequestMapping("/requestparkform")
	public String requestparkform(){
		return "map/requestParkform";
	}
	
	@RequestMapping("/requestpark")
	public void requestpark(MapVo mapvo){
		System.out.println(mapvo.toString());
	}
	
	@RequestMapping("/searchMap")
	public List<MapVo> searchMap(Model model, String keyword){
		List<MapVo> mapvo=mapservice.maplist(keyword);
		model.addAttribute("maplist", mapvo);
		return mapvo;
	}
	
	@ResponseBody
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(@RequestBody MapVo mapVo){
		String result ="true";
		System.out.println(mapVo.toString());
		return result;

	}
}
