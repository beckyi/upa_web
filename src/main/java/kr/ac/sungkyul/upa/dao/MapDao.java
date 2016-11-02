package kr.ac.sungkyul.upa.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.upa.vo.MapVo;

@Repository
public class MapDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	// map main List 
	public List<MapVo> getMainList() {
		List<MapVo> list= sqlSession.selectList("map.getMapList");
		System.out.println("main dao "+list);
		return list;
	}
	
	//map keyword search
	public List<MapVo> getList(String keyword) {
//			System.out.println("1 "+keyword);
			//검색된 지도 리스트 가져오기
			keyword = "%" + keyword + "%";
//			System.out.println("2 "+keyword);
			List<MapVo> list=sqlSession.selectList("map.getMapListKeyword",keyword);
			return list;
	}
	
	//주차장 삽입
	public Integer insert(MapVo mapvo) {
	
//		Integer resultInt = sqlSession.insert("map.insert",mapvo);
		
		System.out.println(mapvo.toString());
		
		Integer resultInt = 1;
		
		return resultInt;
	}
}
