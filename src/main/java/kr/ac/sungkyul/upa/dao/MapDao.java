package kr.ac.sungkyul.upa.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.upa.vo.MapVo;

@Repository
public class MapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// map main List
	public MapVo getList() {
		MapVo mapvo = sqlSession.selectOne("map.getList");
		return mapvo;
	}
	
}
