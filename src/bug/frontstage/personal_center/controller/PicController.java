package bug.frontstage.personal_center.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/pic")
public class PicController {
	
	@RequestMapping(value="/upload",method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file,HttpServletRequest  req,HttpServletResponse  resp) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
	   resp.setContentType("text/html;charset=UTF-8");
		if (!file.isEmpty()) {
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(req.getSession().getServletContext().getRealPath("/file/img/")+"/"+ file.getOriginalFilename()));
			String path="/file/img/"+file.getOriginalFilename();
			System.out.println(path);
	//		req.getSession().setAttribute("path", path);
			result.put("result", path);
		}
		String jsonStr = String.valueOf(JSONObject.fromObject(result));
		return  jsonStr;
	}
}
//	 @RequestMapping(value = "/upload")  
//	 public String fileUpload(@RequestParam("file") CommonsMultipartFile file, 
//	            HttpServletRequest request, ModelMap model) {
//	        
//	        //���ԭʼ�ļ���
//	        String fileName = file.getOriginalFilename();
//	        System.out.println("fileName:"+ fileName);
//	        
////	        //���ļ���
////	        String newFileName = UUID.randomUUID()+fileName;
//	        
//	        //�ϴ���ʲô�ط�
//	        String path = "C:/Users/Administrator/workspace/Bug/WebContent/img/";
//	        File f = new File(path);
//	        if(!f.exists())f.mkdirs();
//	        if(!file.isEmpty()){
//	            try {
//	                FileOutputStream fos = new FileOutputStream(path+fileName);
//	                InputStream in = file.getInputStream();
//	                int b = 0;
//	                while((b=in.read())!=-1){
//	                    fos.write(b);
//	                }
//	                fos.close();
//	                in.close();
//	            } catch (Exception e) {
//	                e.printStackTrace();
//	            }
//	        }
////	        System.out.println("imgurl:"+ path+newFileName);
////	        //�����ļ���ַ������JSPҳ�����
////	        model.addAttribute("fileUrl", path+newFileName);  
//	        return "";
//	    } 
//}
//	 @RequestMapping("/fileUpload2")
//	 public String fileUpload2(HttpServletRequest request,HttpServletResponse response) throws Exception{
//	     CommonsMultipartResolver cmr = new CommonsMultipartResolver(request.getServletContext());
//	     if(cmr.isMultipart(request)){
//	         MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)(request);
//	         Iterator<String> files = mRequest.getFileNames();
//	         while(files.hasNext()){
//	             MultipartFile mFile = mRequest.getFile(files.next());
//	             if(mFile != null){
//	                 String fileName = UUID.randomUUID()+mFile.getOriginalFilename();
//	                 String path = "C:/Users/Administrator/workspace/Bug/WebContent/img/"+fileName;
//	                 
//	                 File localFile = new File(path);
//	                 mFile.transferTo(localFile);
//	                 request.setAttribute("fileUrl", path);
//	             }
//	         }
//	     }
//	     return "fileUpload";
//	 }  