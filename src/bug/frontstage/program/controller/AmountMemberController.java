package bug.frontstage.program.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.program.service.imp.SelectNameServiceAmountimp;

@Controller
public class AmountMemberController {

	@Autowired
	@Qualifier("SelectNameServiceAmountimp")
	private SelectNameServiceAmountimp  selectNameServiceAmountimp;
	
	@RequestMapping("/amountMember")
	@ResponseBody
	public  Map<String,Object> amountMeber(HttpServletRequest req){
		String id  =req.getParameter("pid");
		int pid = Integer.parseInt(id);
		int num = selectNameServiceAmountimp.amountMember(pid);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("num",num);
		return map;
		
	}
	
	
	
}
