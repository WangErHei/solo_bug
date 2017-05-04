package bug.frontstage.bug_info.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.bug_info.service.imp.SelectProduceServiceimp;

@Controller
public class SelectProduceController {

	@Autowired
	@Qualifier("SelectProduceServiceimp")
	 private SelectProduceServiceimp selectProduceServiceimp;
	
	
	@RequestMapping("/selectProduce")
	@ResponseBody
     public  List<Map<String,Object>> selectProduce(HttpServletRequest  req){
		String p_id = req.getParameter("produce_id");
		int pid = Integer.parseInt(p_id);
		List<Map<String,Object>>  listpro = selectProduceServiceimp.selectProduce(pid);	
		req.getSession().setAttribute("pid", pid);
		return  listpro;
		
	}
	
	
}
