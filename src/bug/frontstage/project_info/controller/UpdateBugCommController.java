package bug.frontstage.project_info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.project_info.service.imp.CommBugServiceimp;

@Controller
public class UpdateBugCommController {

	@Autowired
	@Qualifier("CommBugServiceimp")
	private  CommBugServiceimp  commBugServiceimp;
	
	@RequestMapping("/updatecomm")
	@ResponseBody
	public Map<String,Object>  updateComm(int comm_id){
		List<Map<String, Object>>  list = commBugServiceimp.comm(comm_id);
		Map<String,Object> map =new HashMap<String,Object>();
		String comments_content = (String) list.get(0).get("comments_content");
		String comments_photo = (String) list.get(0).get("comments_photo");
		String comments_fu = (String) list.get(0).get("comments_fu");
		String comments_fu_name = (String) list.get(0).get("comments_fu_name");
		map.put("comments_content", comments_content);
		map.put("comments_photo", comments_photo);
		map.put("comments_fu", comments_fu);
		map.put("comments_fu_name", comments_fu_name);
		return map;
	}
	
}
