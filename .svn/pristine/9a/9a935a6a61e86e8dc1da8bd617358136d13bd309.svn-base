package bug.register.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.login.model.Buser;
import bug.frontstage.login.service.imp.LoginServiceImp;
import bug.register.service.imp.RegisterServiceImp;

@Controller
public class RegController {

	@RequestMapping("register")
	public  String toRegister(){
		
		return "register";
	}
	
	
	@Autowired(required = false)
	@Qualifier("RegisterServiceImp")
	private RegisterServiceImp registerServiceImp;
	@Autowired(required = false)
	@Qualifier("LoginServiceImp")
	private LoginServiceImp loginServiceImp;

	@RequestMapping("/registerSub")
	@ResponseBody
	public Map<String,Object> register(HttpServletRequest req,String buser_name,String buser_email,String password) {
		Map<String,Object> map = new HashMap<String,Object>();
		Buser buser = new Buser();
	    buser.setBuser_email(buser_email);
	    buser.setBuser_name(buser_name);
	    buser.setBuser_pass(password);
	    boolean flag= registerServiceImp.good(buser_email);
	    boolean flag1= registerServiceImp.Exit(buser_name);
	    boolean flag2 = registerServiceImp.isExit(buser_email);
	    boolean flag3 = registerServiceImp.isPass(password);
	    if(flag&&flag1&&flag2&&flag3){
	    	
		registerServiceImp.register(buser);
		List<Map<String,Object>> list =new ArrayList<Map<String,Object>>();
		Map<String,Object> map1 =new HashMap<String,Object>();
		map1.put("BUSER_NAME", buser.getBuser_name());
		list.add(map);
		req.getSession().setAttribute("list", list);
		req.getSession().setAttribute("flag", buser);
		int id  =registerServiceImp.findId(buser);
		List<Map<String, Object>> list1 = loginServiceImp.selectName(id);
		req.getSession().setAttribute("id", id);
		req.getSession().setAttribute("list", list1);
	    }
	    else{
	    	map.put("msg", "用户信息填写有误，请重新确认!");
	    }
		return map;

	}

}
