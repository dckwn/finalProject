package com.itbank.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.itbank.model.FoodDTO;
import com.itbank.repository.FoodDAO;

@Service
public class FoodService {

	@Autowired private FoodDAO foodDao;

	public List<FoodDTO> getSearchList(HashMap<String, Object> map) {
		List<FoodDTO> list = new ArrayList<>(); 
		if(map.get("group_name")!=null) {
			String cate = (String) map.get("group_name");
		
			if(cate.contains(",")) {
				String[] catearr = cate.split(",");
				map.put("group_name", catearr);
			}
		}
		
		list = foodDao.selectSearchList(map);
		return list;
	}

	public List<String> getCategory() {
		return foodDao.selectCategory();
	}

	public int add(FoodDTO foodDto) {
		return foodDao.insert(foodDto);
	}

	public List<FoodDTO> getListByUserInsert() {
		return foodDao.selectListByUserInsert();
	}

	public String qrTest(String url) throws WriterException, IOException {
		int width = 200;
        int height = 200;
        String file_path = "D:\\upload\\QR";
        String file_name = "/qr.png";
		File file = null;
		file = new File(file_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		QRCodeWriter writer = new QRCodeWriter();
		url = new String(url.getBytes("UTF-8"), "ISO-8859-1");		

		BitMatrix matrix = writer.encode(url, BarcodeFormat.QR_CODE, width, height);
		int qrColor = 0xaaaaaaaa;
		MatrixToImageConfig config = new MatrixToImageConfig(qrColor, 0xFFFFFFFF);
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(matrix, config);
		ImageIO.write(qrImage, "png", new File(file_path+file_name));
		
        return file_name;
	}
	
}
