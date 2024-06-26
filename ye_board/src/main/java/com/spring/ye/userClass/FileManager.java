package com.spring.ye.userClass;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.ye.bean.entity.BoardFile;
import com.spring.ye.dao.IBoardDao;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FileManager {
	@Autowired
	private IBoardDao bDao;
	
	//파일경로
	String fullPath = "D:/Spring work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ye_board";
	
	public boolean fileUp(MultipartHttpServletRequest multi, int bnum) {
		System.out.println("fileUp");
		
		//1. 이클립스의 물리적 저장경로 찾기
		String root = multi.getSession().getServletContext().getRealPath("/");
		System.out.println("root= " + root);
		String path = root + "upload/";
		
		//2. 폴더 생성을 꼭 할것
		File dir = new File(path);
		if(!dir.isDirectory()) {
			//upload폴더가 없을 경우 폴더 생성
			dir.mkdir();
		}
		
		//3. 파일 가져오기 - 파일태그 1개일때
		Map<String, String> fMap = new HashMap<String, String>();
		fMap.put("bnum",String.valueOf(bnum));
		
		List<MultipartFile> fList = multi.getFiles("files");
		
		boolean f = false;
		for (int i = 0; i < fList.size(); i++) {
			//파일 메모리에 저장
			MultipartFile mf = fList.get(i);
			String oriFileName = mf.getOriginalFilename();
			fMap.put("oriFileName", oriFileName);
			
			//4. 시스템파일 이름 생성 (a.txt =>11232342424.txt)
			String sysFileName = System.currentTimeMillis() + "."
					+ oriFileName.substring(oriFileName.lastIndexOf(".") +1);
			fMap.put("sysFileName", sysFileName);
			
			//5. 메모리 → 실제 파일 업로드
			try {
				//서버 upload에 파일 저장
				mf.transferTo(new File(path + sysFileName));
				f = bDao.fileInsert(fMap);
			} catch (IOException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		} // while of For end
		
		if (f) 
			return true;
		return true;
	}
	
	
	//파일 다운로드
	public void download(String fullPath, String oriFileName, HttpServletResponse resp) throws Exception {
		//한글파일 깨짐 방지
		String downFile = URLEncoder.encode(oriFileName, "UTF-8");
		
		//파일명 뒤에 이상한 문자가 붙는 경우 아래코드로 해결
		downFile = downFile.replaceAll("\\+", "");
		
		//파일 객체 생성
		File file = new File(fullPath);
		//다운로드 경로 파일을 읽어 들임
		InputStream is = new FileInputStream(file);
		
		//반환객체 설정
		resp.setContentType("application/octet-stream");
		resp.setHeader("content-Dispostion", "attachment' filename\"" + downFile + "\"");
		
		//반환객체에 스트림 연결
		OutputStream os = resp.getOutputStream();
		
		//파일쓰기
		byte[] buffer = new byte[1024];
		int length;
		while ((length = is.read(buffer)) != -1) {
			os.write(buffer, 0, length);
		}
		os.flush();
		os.close();
		os.close();
	}
	
	
	//파일삭제
	public void delete(List<BoardFile> bfList) {
		for (BoardFile bf: bfList) {
			File file = new File(fullPath + bf.getBf_sysname());
			
			if(file.exists()) {
				System.out.println("파일삭제");
				file.delete();
			}else {
				log.info("이미 삭제된 파일");
			}
		}
	}
}
