package kr.ac.sungkyul.upa.controller;

import java.io.IOException;
import java.util.Map;

//import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	//테스트
	@RequestMapping("/text")
	public String text(){
		return "user/text";
	}
	
	//가짜 안드로이드 창
	@RequestMapping("/android")
	public String android(){
		return "main/tempAndroid";
	}
	
	//테스트 등록 이미지
	@RequestMapping(value="register", method=RequestMethod.POST)
	public void registerBoard(MultipartFile file) throws Exception{
//		System.out.println(bbsVo.toString());
//		System.out.println(file.getOriginalFilename());
		userservice.attach(file);
		
	}
	
	//회원가입 폼 출력
	@RequestMapping("/joinform")
	public String joinform(){
		return "user/joinform";
	}
	
	// 회원가입
	@RequestMapping("/join")
	public String join(@ModelAttribute UserVo vo, MultipartFile file) throws IOException{
		System.out.println("join: "+vo.toString());
		System.out.println(file.getOriginalFilename());
		userservice.join(vo, file);
		return "redirect:/user/joinsuccess";
	}
	
	// 아이디 중복 검사
	@ResponseBody	
	@RequestMapping(value = "CheckEmail", method = RequestMethod.POST)
	public Map<String, Object> checkEmail(String id) {	//Request 객체받음, script or DB 객체 분별
		Map<String, Object> map = userservice.checkEmail(id);
		return map;
	}
	
	//회원가입 성공
	@RequestMapping("/joinsuccess")
	public String joinSuccess(){
		return "user/joinsuccess";
	}

	//1. Ajax 사용 시 - DB (로그인 정보 비교)
	@ResponseBody
	@RequestMapping(value = "checkLogin", method = RequestMethod.POST)
	public String checkId(String id, String password, HttpSession session) {	//Request 객체받음, script or DB 객체 분별
		
		UserVo authUser =  userservice.login(id,  password);
		
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
	
	//회원 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("authUser");
		session.invalidate();	//로그아웃 처리 시 세션을 지워줌
		
		return "redirect:/main";
	}
	
	//수정 폼 출력
	@RequestMapping("/modifyform")
	public String modifyform(HttpSession session, Model model){
		//로그인한 회원정보 가져오기
		UserVo temp = (UserVo)session.getAttribute("authUser");
		Long no = temp.getNo();
		
		//수정폼 출력 시 입력된 내용 출력
		UserVo nvo = userservice.get(no);
		model.addAttribute("userVo", nvo);
		
		return "user/modifyform";
	}
	
	//회원 정보 수정
	@RequestMapping("/modify")
	public String modify(HttpSession session, @ModelAttribute UserVo vo, MultipartFile file) throws IOException{
		System.out.println(file.getOriginalFilename());
		
		UserVo temp = (UserVo)session.getAttribute("authUser");
		Long no = temp.getNo();
		
		vo.setNo(no);
		
		userservice.update(vo,file);
		return "user/modifysuccess";
	}
	
	//파일 업로드
	@RequestMapping(value="attach", method=RequestMethod.POST)
	public String attachBoard(MultipartFile file) throws Exception{
//		System.out.println(file.getOriginalFilename());
		userservice.attach(file);
		
		return "redirect:/main";
	}
	
	//아이디/비밀번호 찾기 폼
	@RequestMapping("/findInfo")	
	public String findInfo(){
		return "user/findInfo";
	}
	
	// 아이디 찾기
	@RequestMapping("/idFind")	
	public String idFind(@ModelAttribute UserVo vo, Model model){

		String id = userservice.idfind(vo);

		if(id == null){	//계정 정보가 없을 경우
			Boolean result = false;
			model.addAttribute("result", result);
			return "user/findInfo";
		}
		
		model.addAttribute("id",id);
		return "user/idresult";
	}
	
	//비밀번호 찾기
	@ResponseBody
	@RequestMapping(value = "checkPass", method = RequestMethod.POST)	
	public String checkPass(@RequestBody UserVo userVo, HttpSession session) {	//Request 객체받음, script or DB 객체 분별
		
		//회원 정보가 있는지 확인
		UserVo temp = userservice.checkPass(userVo);
		
		Long no = temp.getNo();
		String name = temp.getName();
		String email = temp.getEmail();
		
		String result = "true";
		
		if(name == null){
			result = "false";
		}
		else {
			try {
				result = userservice.sendEmail(no, name, email);
				System.out.println(result);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
	
	//메일 전송 완료 (임시 비밀번호 전송)
	@RequestMapping("/passresult")	
	public String passResult(){
		return "user/passresult";
	}
	
	
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
