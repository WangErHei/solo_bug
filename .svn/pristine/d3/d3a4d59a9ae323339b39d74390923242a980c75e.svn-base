package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.project_info.service.imp.ProgramServiceimp;

@Controller
public class SelectAllProduceController {

	@Autowired(required=false)
	@Qualifier("ProgramServiceimp")
	private ProgramServiceimp  programServiceimp;
	
	@RequestMapping("/select")
	@ResponseBody
	public List<Map<String, Object>> selectAllProduce(HttpServletRequest  req,int pid){
		List<Map<String, Object>> list = 	programServiceimp.selectAllProduce(pid);
		return list;
	}
	
	
}
