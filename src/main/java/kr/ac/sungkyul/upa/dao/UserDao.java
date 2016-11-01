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
	
	//회원정보 수정
	public void update(UserVo vo) {
		
		String pass = vo.getPassword();
		
		if(pass == null){
			sqlSession.update("user.update",vo);						
		} else{
			sqlSession.update("user.update2",vo);		
		}
		
	}
	
	public void insertAttachFile(AttachFileVo vo){
		/*sqlSession.insert("user.attach",vo);*/		
	}
	
	public String find(UserVo vo) { // id find
			
			String id = sqlSession.selectOne("user.idFind",vo);
			return id;
		}
	
}
