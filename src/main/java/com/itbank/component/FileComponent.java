package com.itbank.component;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileComponent {

	private String saveDirectory = "c:\\upload";
	
	public FileComponent() {
		File f = new File(saveDirectory);
		if(f.exists() == false) {
			f.mkdirs();
		}
	}
	
	
	public String upload(MultipartFile f) {
		String originalFileName = f.getOriginalFilename();
		String storedFileName = UUID.randomUUID().toString().replace("-", "");
		String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
		storedFileName += ext;
		
		File dest = new File(saveDirectory, storedFileName);
		try {
			f.transferTo(dest);
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		} 
		return storedFileName;
	}
	
	
	
	
	
	
	
	
}
