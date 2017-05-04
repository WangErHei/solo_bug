package bug.frontstage.project_info.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
public class DeleteController {

	@Autowired
	@Qualifier("DeleteServiceimp")
	private DeleteServiceimp deleteServiceimp;
	
	@Autowired(required=false)
	@Qualifier("ProgramServiceimp")
	private ProgramServiceimp  programServiceimp;
	

	@RequestMapping("/deletep")
	@ResponseBody
	public List< Map<String,Object> >delete(int pid,String name){
		 List<Map<String,Object>>  list  =new ArrayList <Map<String,Object>>();
		boolean flag =deleteServiceimp.isDelete(pid, name);
		if(flag){
			   list = programServiceimp.selectAllProduce(pid);
			
		 Map <String,Object>  map =new HashMap<String,Object>();
			map.put("msg","该模块正在被使用，不能删除~!~");
		    list.add(map);
			
		}
		else{
		deleteServiceimp.deleteP(name, pid);
		  list = programServiceimp.selectAllProduce(pid);
		}
		return list;
	}	
}
