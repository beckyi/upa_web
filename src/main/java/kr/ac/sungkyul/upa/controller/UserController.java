package kr.ac.sungkyul.upa.controller;

import java.util.Map;

//import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.upa.service.UserService;
import kr.ac.sungkyul.upa.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userservice;

	@RequestMapping("/text")
	public String text(){
		return "user/text";
	}
	
	@RequestMapping("/joinform")
	public String joinform(){
		return "user/joinform";
	}
	

	@RequestMapping("/requestpark")
	public String requestpark(){
		return "user/requestPark";
	}
	
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo vo){
		System.out.println("join: "+vo.toString());
		userservice.join(vo);
		return "redirect:/user/joinsuccess";
	}
	
	@ResponseBody	// 아이디 중복 검사
	@RequestMapping(value = "CheckEmail", method = RequestMethod.POST)
	public Map<String, Object> checkEmail(String id) {	//Request 객체받음, script or DB 객체 분별
		System.out.println(id);
		
		Map<String, Object> map = userservice.checkEmail(id);
		return map;
	}
	
	@RequestMapping("/joinsuccess")
	public String joinSuccess(){
		return "user/joinsuccess";
	}

	//1. Ajax 사용 시 - DB (로그인 정보 비교)
	@ResponseBody
	@RequestMapping(value = "checkLogin", method = RequestMethod.POST)
	public String checkId(String id, String password, HttpSession session) {	//Request 객체받음, script or DB 객체 분별
		
		System.out.println("controll "+id+" "+password);
		
		UserVo authUser =  userservice.login(id,  password);
		System.out.println(authUser);
		
		String result = "true";
		
		if(authUser == null){
			result = "false";
		} else {
			//인증성공
			session.setAttribute("authUser",authUser);
			result = "true";
		}
		return result;
		
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("authUser");
		session.invalidate();	//로그아웃 처리 시 세션을 지워줌
		
		return "redirect:/main";
	}
	
	@RequestMapping("/modifyform")
	public String modifyform(HttpSession session, Model model){
		UserVo temp = (UserVo)session.getAttribute("authUser");
		
		Long no = temp.getNo();
		
		UserVo nvo = userservice.get(no);
		model.addAttribute("userVo", nvo);
		
		return "user/modifyform";
	}
	
	@RequestMapping("/modify")
	public String modify(HttpSession session, @ModelAttribute UserVo vo){
		
		UserVo temp = (UserVo)session.getAttribute("authUser");
		Long no = temp.getNo();
		
		vo.setNo(no);
		
		userservice.update(vo);
		return "user/modifysuccess";
	}
	
	@RequestMapping(value="attach", method=RequestMethod.POST)
	public String registerBoard(MultipartFile file) throws Exception{
//		System.out.println(bbsVo.toString());
//		System.out.println(file.getOriginalFilename());
		userservice.attach(file);
		
		return "redirect:/main";
	}
//	
//	@RequestMapping("/findInfo")	//찾기 폼
//	public String findInfo(){
//		return "user/findInfo";
//	}
//
//	@RequestMapping("/idFind")	// 아이디 찾기
//	public String idFind(@ModelAttribute UserVo vo, Model model){
//
//		String email = userService.idfind(vo);
//
//		if(email == null){	//계정 정보가 없을 경우
//			Boolean result = false;
//			model.addAttribute("result", result);
//			return "user/findInfo";
//		}
//		
//		model.addAttribute("email",email);
//		return "user/idresult";
//	}
//		
//	@ResponseBody
//	@RequestMapping(value = "checkPass", method = RequestMethod.POST)	//비밀번호 찾기 검사
//	public String checkPass(@RequestBody UserVo userVo, HttpSession session) {	//Request 객체받음, script or DB 객체 분별
//		String email = userService.checkPass(userVo);
//		String result = "true";
//		
//		if(email == null){
//			result = "false";
//		}
//		else {
//			try {
//				result = userService.sendEmail(email);
//				System.out.println(result);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		return result;
//	}
//	
//	@RequestMapping(value = "/{domain}/repassword", method = RequestMethod.GET)
//	public String abc(@PathVariable String domain, Model model){
//		Long no = userService.passlink(domain);
//		System.out.println(no);
////		비밀번호 변경창으로 보냄 (어떤 멤버인지는 알아야 함)
//		model.addAttribute("userno", no);
//		
//		return "user/repassword";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value ="/setPass", method = {RequestMethod.GET, RequestMethod.POST})	//재설정 비번 저장
//	public String setPassword(Long no, String password){
//		//state 1로 변경
//		String result = userService.setpass(no,password);
//		System.out.println("controller: "+result);
//		return result;
//	}
//	
//	@RequestMapping("/passresult")	//메일 전송 완료
//	public String passResult(){
//		return "user/passresult";
//	}
//	
//	@RequestMapping("/repasswordSuccess")	//비번 재설정 완료
//	public String repasswordSuccess(){
//		return "user/repasswordSuccess";
//	}
//	
//	
//	//회원 관리
//	@RequestMapping(value = "mlist")
//	public String mlist(Model model, 
//			@RequestParam(value = "p", required = true, defaultValue = "1") String page,
//			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword){//Request 객체받음, script or DB 객체 분별
//		
//		Map<String, Object> map =userService.userManage(page, keyword);
//		model.addAttribute("map", map);
//		
//		return "user/mlist";
//	}
}
