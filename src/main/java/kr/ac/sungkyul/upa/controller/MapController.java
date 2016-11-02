package kr.ac.sungkyul.upa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.upa.service.MapService;
import kr.ac.sungkyul.upa.vo.MapVo;
import kr.ac.sungkyul.upa.vo.UserVo;

@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired MapService mapservice;
	
	//주차장 신청 폼
	@RequestMapping("/requestparkform")
	public String requestparkform(){
		return "map/requestParkform";
	}
	
	//주차장 신청
	@RequestMapping("/requestpark")
	public void requestpark(MapVo mapvo){
		System.out.println(mapvo.toString());
	}
	
	//지도 리스트
	@RequestMapping("/searchMap")
	public List<MapVo> searchMap(Model model, String keyword){
		List<MapVo> mapvo=mapservice.maplist(keyword);
		model.addAttribute("maplist", mapvo);
		return mapvo;
	}
	
	//삽입
	@ResponseBody
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(@RequestBody MapVo mapVo, HttpSession session){
		
		UserVo temp = (UserVo)session.getAttribute("authUser");
		String name = temp.getName();
		
		mapVo.setName(name);
		
		System.out.println(mapVo.toString());
		String result  = mapservice.insert(mapVo);
		return result;
	}
}
