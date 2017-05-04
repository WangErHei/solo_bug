package bug.register.controller;

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

import bug.register.service.imp.RegisterServiceImp;

@Controller
public class SelectNameController {

	@Autowired(required = false)
	@Qualifier("RegisterServiceImp")
	private RegisterServiceImp registerServiceImp;
	
	@RequestMapping("/lookup")
	@ResponseBody
	public  Map<String,Object>  selectName(HttpServletRequest req,HttpServletResponse  resp) throws IOException{
		Map<String,Object>  map =new HashMap<String,Object> ();
 		String buser_email = req.getParameter("buser_email");
		boolean flag = registerServiceImp.isExit(buser_email);
		boolean flag1=registerServiceImp.good(buser_email);
		if(flag &&buser_email==""  ){
			map.put("result", "不能为空！");
		}
		 if(!flag &&""!=buser_email && buser_email !=null){
				map.put("result","邮箱被注册！！");
			}
		if(flag&&flag1&&buser_email!=null && "" !=buser_email){
			map.put("result","注册成功！");
		}
		 else	if(!flag1&&""!=buser_email && buser_email !=null){
			map.put("result","邮箱格式错误！");
		}
		
	
		return map;
		
	
}
}