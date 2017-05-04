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
public class SelectAllMemberController {

	@Autowired
	@Qualifier("ProgramServiceimp")
	private ProgramServiceimp  programServiceimp;
	
	@RequestMapping("/toMember")
	@ResponseBody
    public  List<Map<String,Object>> selectMember(HttpServletRequest  req,int pid){
    
    	List<Map<String,Object>>  listmember = 	programServiceimp.selectAllMember(pid);
    	return listmember;
	
}
}