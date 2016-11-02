package kr.ac.sungkyul.upa.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.upa.vo.AttachFileVo;
import kr.ac.sungkyul.upa.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// login
	public UserVo login(UserVo uservo) {
				
		UserVo vo = sqlSession.selectOne("user.login", uservo);
		return vo;
	}
	
	// id 유효성 검사
	public Long checkEmail(String id) { 

		Long no = sqlSession.selectOne("user.checkEmail",id);
		return no;
	}
	
	//sign up
	public void insert(UserVo vo) {
//		System.out.println("회원가입 완료 " +vo.toString());
		sqlSession.insert("user.insert",vo);
	}
	
	//회원 정보 수정 시 정보 가져옴
	public UserVo get(Long no) {	
		UserVo vo = sqlSession.selectOne("user.getModify",no);
		return vo;
	}
	
	//회원정보 수정 (비번 입력X)
	public void update(UserVo vo) {
		sqlSession.update("user.update",vo);						
	}
	
	//회원정보 수정 2 (비번 입력O)
	public void update2(UserVo vo){
		sqlSession.update("user.update2",vo);	
	}
	//회원정보 수정 3 (이미지 O 비번 입력X)
	public void update3(UserVo vo){
		sqlSession.update("user.update3",vo);	
	}
	//회원정보 수정 4 (이미지 O 비번 입력O)
	public void update4(UserVo vo){
		sqlSession.update("user.update4",vo);	
	}
	
	public void insertAttachFile(AttachFileVo vo){
		/*sqlSession.insert("user.attach",vo);*/		
	}
	
	// id find
	public String find(UserVo vo) { 
			
		String id = sqlSession.selectOne("user.idFind",vo);
		return id;
	}
	
	public UserVo passfind(UserVo vo) { // password find check
		
		UserVo usrevo = sqlSession.selectOne("user.passFind",vo);	//no, name, email 받아옴
		return usrevo;
	}
	
	// temp password
	public void tempPass(UserVo vo) { 
		sqlSession.selectOne("user.tempPass",vo);
	}
}
