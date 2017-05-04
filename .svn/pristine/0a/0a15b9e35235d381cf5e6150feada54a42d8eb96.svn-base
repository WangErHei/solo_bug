package bug.frontstage.personal_center.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("down")
public class FuDownController {

	@RequestMapping("/fudownload")
	public ResponseEntity<byte[]> fudownload(HttpServletRequest  req) throws IOException{
		 String name= req.getParameter("fu");
		 String path = name;
		  File file = new File(path);
		  HttpHeaders  headers =new HttpHeaders();
		  String fileName =new  String (name.getBytes("UTF-8"),"iso-8859-1");
		  headers.setContentDispositionFormData("attachment", fileName);
		  headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		  return  new  ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers,HttpStatus.CREATED);
	}
	
}
	
