package kr.ac.sungkyul.upa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.upa.dao.MapDao;
import kr.ac.sungkyul.upa.vo.MapVo;

@Service
public class MapService {
	@Autowired
	private MapDao mapdao;
	
	// 지도 리스트 가져오기 (메인창)
	public List<MapVo> mapmainlist(){
		List<MapVo> list = mapdao.getMainList();
		return list;
	}
		
	// 지도 리스트 가져오기
	public List<MapVo> maplist(String keyword){
		List<MapVo> list = mapdao.getList(keyword);
		return list;
	}
	
	//주차장 삽입(좌표 분리하여 저장)
	public String insert(MapVo mapvo){
		
		Integer resultInt = mapdao.insert(mapvo);
		String result = String.valueOf(resultInt); // String 변환
		
		if(result == "1"){
			result = "true";
		} else{
			result = "false";
		}
		
		return result;
	}
}
