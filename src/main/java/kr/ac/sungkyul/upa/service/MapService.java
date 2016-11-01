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
}
