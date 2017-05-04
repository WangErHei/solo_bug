package bug.frontstage.project_info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.project_info.service.imp.UpdateBugServiceimp;

@Controller
public class UpdateBugController {

	@Autowired(required=false)
	@Qualifier("UpdateBugServiceimp")
    private UpdateBugServiceimp  updateBugServiceimp;	
	
	@RequestMapping("/updatebug")
	@ResponseBody
	public Map<String,Object> UpdateBug(int bug_id,int pid,HttpServletRequest  req){
		
		List<Map<String,Object>>  updatebug = updateBugServiceimp.updateBug(bug_id);
		Map<String,Object> map =new HashMap<String,Object>();
		String bug_title = (String) updatebug.get(0).get("bug_title");
		String bug_describe = (String) updatebug.get(0).get("bug_describe");
		String produce_name = (String) updatebug.get(0).get("produce_name");
		String bug_maker = (String) updatebug.get(0).get("bug_maker");
		String bug_photo = (String) updatebug.get(0).get("bug_photo");
		String bug_type = (String) updatebug.get(0).get("bug_type");
		String bug_fu_name = (String) updatebug.get(0).get("bug_fu_name");
		String bug_fu = (String) updatebug.get(0).get("bug_fu");
		map.put("bug_title", bug_title);
		map.put("bug_describe", bug_describe);
		map.put("produce_name", produce_name);
		map.put("bug_maker", bug_maker);
		map.put("bug_photo", bug_photo);
		map.put("bug_fu_name", bug_fu_name);
		map.put("bug_type", bug_type);
		map.put("bug_fu", bug_fu);
		return map;
		
	}
}
