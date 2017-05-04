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
public class SelectConntroller {
	@Autowired(required = false)
	@Qualifier("RegisterServiceImp")
	private RegisterServiceImp registerServiceImp;
	
	@RequestMapping("/look")
	@ResponseBody
	public  Map<String,Object>  selectName(HttpServletRequest req,HttpServletResponse  resp) throws IOException{
		Map<String,Object>  map =new HashMap<String,Object> ();
 		String buser_name = req.getParameter("buser_name");
		boolean flag = registerServiceImp.Exit(buser_name);
	 
		if(flag &&buser_name==""  ){
			map.put("result", "不能为空！");
		}
		
		if(flag &&""!=buser_name && buser_name !=null){
			map.put("result","注册成功！");
		}
		
		
		else if(!flag && ""!=buser_name && buser_name !=null) {
			map.put("result","用户被注册！！");
		}
		return map;
		
	
}
}

