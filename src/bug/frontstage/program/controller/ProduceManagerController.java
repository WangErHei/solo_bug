package bug.frontstage.program.controller;

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

import bug.frontstage.program.service.imp.InsertProduceServiceimp;

@Controller
public class ProduceManagerController {
  
	
	@Autowired
	@Qualifier("InsertProduceServiceimp")
	private InsertProduceServiceimp insertProduceServiceimp;
	
	@RequestMapping("/addProduce")
	@ResponseBody
	public List<Map<String,Object>>  produceManager(HttpServletRequest req){
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String,Object> ();
		String id = req.getParameter("pid");
		int pid = Integer.parseInt(id);	
		String produce_name  = req.getParameter("produce_name");
	   boolean flag = 	insertProduceServiceimp.isProduce(produce_name);
	   if(flag){
		insertProduceServiceimp.insertProduce(produce_name,pid);
		int  produce_id = insertProduceServiceimp.getProduceId(produce_name);
		insertProduceServiceimp.insertProgramProduce(pid, produce_id);
		 list = insertProduceServiceimp.selectAllProduce(pid);
		return list;
	   }else{
		   list = insertProduceServiceimp.selectAllProduce(pid);
		   map.put("pmsg", "模块名已存在，不可重复!");
		   list.add(map);
		   return list;
	   }
	}
	
}
