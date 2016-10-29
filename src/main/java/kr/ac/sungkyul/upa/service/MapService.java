package kr.ac.sungkyul.upa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.upa.dao.MapDao;
import kr.ac.sungkyul.upa.vo.MapVo;

@Service
public class MapService {
	@Autowired
	private MapDao mapdao;
	
	// 지도 리스트 가져오기
	public MapVo login(String id, String password){ // 로그인
		MapVo mapvo = mapdao.getList();
		return mapvo;
	}
}
