package kr.ac.sungkyul.upa.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.upa.dao.MapDao;
import kr.ac.sungkyul.upa.vo.AttachFileVo;
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
	public String insert(MapVo mapvo, MultipartFile image,
						 MultipartFile image2,MultipartFile image3) throws IOException{
		
		//DB에 이미지 이름 저장
		String saveName1 = attachFile(image);
		mapvo.setImage(saveName1);
		
		String saveName2 = attachFile(image2);
		mapvo.setImage2(saveName2);
		
		String saveName3 = attachFile(image3);
		mapvo.setImage3(saveName3);
		
		System.out.println("-- "+mapvo.toString());
		
		Integer resultInt = mapdao.insert(mapvo);
		String result = String.valueOf(resultInt); // String 변환
		
		if(result == "1"){
			result = "true";
		} else{
			result = "false";
		}
		
		return result;
	}
	
	public  String attachFile(MultipartFile file) throws IOException{
		
		//이미지 저장//
		//3.orgName 
		String orgName= file.getOriginalFilename();
		
		//4.fileSize 
		Long fileSize = file.getSize();
		
		//5.saveName 
		// (1) Calendar객체를 얻는다.
		Calendar cal = Calendar.getInstance();
		// (2) 출력 형태를 지정하기 위해 Formatter를 얻는다.
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddhhmmss");
		// (3) 출력형태에 맞는 문자열을 얻는다.
		String datetime1 = sdf1.format(cal.getTime());
		//현재시간을 이미지이름으로 저장
		String saveName = datetime1 + orgName;
		
		//6.path
		String path="c:\\upload\\park";
		
		AttachFileVo attachFileVo = new AttachFileVo();
		attachFileVo.setPath(path);
		attachFileVo.setOrgName(orgName);
		attachFileVo.setSaveName(saveName);
		attachFileVo.setFileSize(fileSize);
		
		System.out.println(attachFileVo.toString());
		
		File target = new File(path,saveName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		return saveName;
	}
}
