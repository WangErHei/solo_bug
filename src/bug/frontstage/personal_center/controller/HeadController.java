package bug.frontstage.personal_center.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import bug.frontstage.personal_center.service.imp.HeadUploadService;
import sun.misc.BASE64Decoder;

@Controller
public class HeadController {

	@Autowired
	@Qualifier("HeadUploadService")
	private HeadUploadService  headUploadService;
  ObjectMapper   om = new ObjectMapper();
  
	@RequestMapping("/headupload")
   @ResponseBody
	public void  head(HttpServletRequest  req,int bid,HttpServletResponse  resp) throws IOException{
		resp.setContentType("application/json");
		Map <String,Object> data = new HashMap<String, Object>();
		  // 去掉前面的data:image/png;base64,  
		 File file = new File(req.getSession().getServletContext().getRealPath("/file/img/"));
         if(!file .exists()  && !file .isDirectory()){
         	file.mkdirs();
         }
				String base64Str = req.getParameter("image");
				String end = base64Str.substring(11, base64Str.indexOf(";"));
			       System.out.println(end);
		        if (base64Str.indexOf("data:image/png;base64,") != -1) {  
		            base64Str = base64Str.replace("data:image/png;base64,", "");  
		     
		        }  
		        BASE64Decoder decoder = new BASE64Decoder();
		        // 生成jpeg图片  
		       
	            FileOutputStream out = null; 
	            File file1= new File(req.getSession().getServletContext().getRealPath("/file/img/")+"/"+bid+"."+end);
	            out = new FileOutputStream(file1); 
     
		      
		            // Base64解码  
		            byte[] b = decoder.decodeBuffer(base64Str);  
		            for (int i = 0; i < b.length; ++i) {  
		                if (b[i] < 0) {// 调整异常数据  
		                    b[i] += 256;  
		                }  
		            }  
		           
		             
		            String head="/file/img/"+bid+"."+end;
		            headUploadService.headUpload(bid, head);
		            out.write(b);  
		            out.flush();
				   out.close();
		           data.put("result", "ok");
		           data.put("head",head);
		           req.getSession().setAttribute("head", head);
		           data.put("file", req.getSession().getServletContext().getRealPath("/file/img/")+"/"+bid+"."+end);		     
		  	       om.writeValue(resp.getOutputStream(), data);
		
	}
 	
	
	
}
