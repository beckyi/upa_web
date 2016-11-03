package kr.ac.sungkyul.upa.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	//주차장 신청 완료
	@RequestMapping("/parksuccess")
	public String parksuccess(){
		return "map/parksuccess";
	}
	
	//지도 리스트
	@RequestMapping("/searchMap")
	public List<MapVo> searchMap(Model model, String keyword){
		List<MapVo> mapvo=mapservice.maplist(keyword);
		model.addAttribute("maplist", mapvo);
		return mapvo;
	}
	
	//삽입 (주차장 등록)
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String insert(MapVo mapVo, HttpSession session, @RequestParam("file1") MultipartFile image,
						 @RequestParam("file2") MultipartFile image2, @RequestParam("file3") MultipartFile image3) throws IOException{
		
		UserVo temp = (UserVo)session.getAttribute("authUser");
		String name = temp.getName();
		
		mapVo.setMaster(name);
		
		System.out.println(mapVo.toString());
		String result  = mapservice.insert(mapVo, image, image2, image3);
		return result;
	}
}
