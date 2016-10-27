package kr.ac.sungkyul.upa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.upa.dao.UserDao;
import kr.ac.sungkyul.upa.vo.UserVo;

@Service
public class UserService {
	@Autowired
	private UserDao usersdao;
	
	// 회원가입
	public void join(UserVo vo){ 
		usersdao.insert(vo);
	}
	
	// 로그인
	public UserVo login(String id, String password){ // 로그인
		UserVo authUser = usersdao.login(id,password);
		return authUser;
	}
}
