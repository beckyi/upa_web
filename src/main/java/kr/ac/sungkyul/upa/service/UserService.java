package kr.ac.sungkyul.upa.service;

import java.io.File;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.upa.dao.UserDao;
import kr.ac.sungkyul.upa.vo.AttachFileVo;
import kr.ac.sungkyul.upa.vo.UserVo;

@Service
public class UserService {
	@Autowired
	private UserDao usersdao;
	
	@Autowired
	private MailSender mailSender;
	
	// 로그인
	public UserVo login(String id, String password){ // 로그인
		
		UserVo uservo = new UserVo();
		uservo.setId(id);
		
		//비밀번호 암호화
		String password_SHA = SHACheckSumExample(password);
		uservo.setPassword(password_SHA);
		UserVo authUser = usersdao.login(uservo);
		return authUser;
	}
	
	//아이디 유효성 검사
	public Map<String, Object> checkEmail(String id){	
		
		Long no = usersdao.checkEmail(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "success");
		map.put("data", no != null);	//존재할 경우 true
		
		return map;
	}
	
	//비밀번호 암호화 (sha1 해시 암호화)
	public String SHACheckSumExample(String password){
		String SHA = ""; 
		System.out.println(password);
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(password.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
//			System.out.println("sha " +SHA);
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
	
	// 회원가입
	public void join(UserVo vo){
		//비밀번호 암호화
		String password = vo.getPassword();
		password = SHACheckSumExample(password);
		vo.setPassword(password);
		
		usersdao.insert(vo);
	}
	
	//회원정보 수정 시 정보 출력
	public UserVo get(Long no){	
		UserVo uservo = usersdao.get(no);
		return uservo;
	}
	
	// 회원정보 수정
	public void update(UserVo vo){ 
		String password = vo.getPassword();
		
		if(password == ""){
			usersdao.update(vo);	
		} else{
			password = SHACheckSumExample(password);
			vo.setPassword(password);
			usersdao.update2(vo);
		}
	}
	
	/*public JFrame imageload(){
		Image image = null;
        try {
            URL url = new URL("http://220.67.115.35/UPA/UserImages/20161025010115.png");
            image = ImageIO.read(url);
        } catch (IOException e) {
        	e.printStackTrace();
        }

        JFrame frame = new JFrame();
        frame.setSize(300, 300);
        JLabel label = new JLabel(new ImageIcon(image));
        frame.add(label);
        frame.setVisible(true);
        
        return frame;
	}*/
	
	public void attach(MultipartFile file) throws IOException{
		//1. fno: 저장할때
		
		//3.orgName 
		String orgName= file.getOriginalFilename();
		
		//4.fileSize 
		Long fileSize = file.getSize();
		
		//5.saveName 
		String saveName = UUID.randomUUID().toString()+"-"+orgName;
		
		//6.path
		String path="http://220.67.115.35//UPA//MapReg.php";
		
		AttachFileVo attachFileVo = new AttachFileVo();
		attachFileVo.setPath(path);
		attachFileVo.setOrgName(orgName);
		attachFileVo.setSaveName(saveName);
		attachFileVo.setFileSize(fileSize);
		
		System.out.println(attachFileVo.toString());
//				System.out.println("service: "+bbsVo.toString());
		/*usersdao.insertAttachFile(attachFileVo);*/
		
		File target = new File(path,saveName);
		FileCopyUtils.copy(file.getBytes(), target);
	}
	
	//아이디찾기
	public String idfind(UserVo vo){ //아이디 찾기
		String id = usersdao.find(vo);
		return id;
	}
	
	//비밀번호 찾기 시 검사
	public UserVo checkPass(UserVo vo){	
		UserVo uservo = usersdao.passfind(vo);
		return uservo;
	}
	
	 public String sendEmail(Long no, String name, String email) throws Exception {
	    	
	    	SimpleMailMessage message = new SimpleMailMessage();
	    	
	    	String ranPass = RandomPasswd();
	    	System.out.println("ran "+ranPass);
	    	
	    	String sender = "UPA@naver.com"; 
	    	String receiver = "beckyi@naver.com"; //받을사람의 이메일입니다.
	        String subject = "UPA 회원님의 임시 비밀번호입니다.";
	        String content = "안녕하세요. UPA입니다. "+name+" 회원님의 임시 비밀번호 입니다. 로그인 후 변경 해주기 바랍니다.\n" 
	        				+"임시 비밀번호: "+ ranPass;
	    	
	        message.setFrom(sender);
	        message.setTo(receiver);
	        message.setSubject(subject);
	        message.setText(content);
	        mailSender.send(message);
	        
	        System.out.println("이메일 전송");
	        
	        //임시 비번으로 비번 변경
	        String sh_ranPass = SHACheckSumExample(ranPass); //암호화
	        
	        UserVo uservo = new UserVo();
	        uservo.setNo(no);
	        uservo.setPassword(sh_ranPass);
	        
	        usersdao.tempPass(uservo);
	        
	        String result = "true";
	        return result;
	 }
	 
	 /*임시 비밀번호 발급 클래스*/
	 public String RandomPasswd(){

	     //임시비밀번호 8자리
	     final int digit = 8;

	     //임시 비밀번호 발급
	    
         StringBuilder sb = new StringBuilder();
//	     int type = 0;

         for(int i=0;i<digit;i++)
         {
             sb.append((int)(Math.random()*9));

         }
         
         String ranpass = sb.toString();
         
         return ranpass;
     
	 }
}
