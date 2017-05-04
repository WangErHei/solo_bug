package bug.frontstage.project_info.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.project_info.service.imp.DeleteServiceimp;
import bug.frontstage.project_info.service.imp.ProgramServiceimp;

@Controller
public class DeletemController {

	@Autowired
	@Qualifier("DeleteServiceimp")
	private DeleteServiceimp deleteServiceimp;
	
	@Autowired(required=false)
	@Qualifier("ProgramServiceimp")
	private ProgramServiceimp  programServiceimp;
	
	@RequestMapping("/deletem")
	@ResponseBody
	public List<Map<String,Object>> deleteM(int pid,String name){
		deleteServiceimp.deleteM(name, pid);
		List<Map<String,Object>>  listmember = programServiceimp.selectAllMember(pid);
		return listmember;
	}
	
	
	
}
