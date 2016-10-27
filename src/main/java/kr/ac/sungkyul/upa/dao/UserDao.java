package kr.ac.sungkyul.upa.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.upa.vo.UserVo;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//sign up
	public void insert(UserVo vo) {
//		sqlSession.insert("user.insert",vo);
	}
	
	 // login
	public UserVo login(String id, String password) {
		
		UserVo userVo = new UserVo();
		userVo.setId(id);
		userVo.setPassword(password);

		UserVo vo = sqlSession.selectOne("user.login", userVo);
		return vo;
	}
}
