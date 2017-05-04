package bug.frontstage.test_case.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bug.frontstage.test_case.service.imp.TestCaseServiceImp;

@Controller
public class UpdateShowCaseController {

	@Autowired(required=false)
	@Qualifier("TestCaseServiceImp")
	private TestCaseServiceImp testCaseServiceImp;
	
	
	@RequestMapping("/Toshowcase")
	@ResponseBody
	public  Map<String,Object>  showUpdate(int caseId){
		Map<String,Object> map =new HashMap<String,Object>();
		List<Map<String,Object>> list = testCaseServiceImp.showOneTestCase(caseId);
		Object group = list.get(0).get("group_id");
		int caseGroupSelectVal = Integer.parseInt(String.valueOf(group));
		Object produce = list.get(0).get("produce_id");
		int caseProduceSelectVal = Integer.parseInt(String.valueOf(produce));
		Object manager = list.get(0).get("case_manager");
		int caseManagerSelectVal = Integer.parseInt(String.valueOf(manager));
		Object state = list.get(0).get("case_state");
		String caseStateSelectVal = String.valueOf(state);
		Object prop = list.get(0).get("prop_name");
		String casePropSelectVal = String.valueOf(prop);
		String case_photo = (String) list.get(0).get("case_photo");
		String case_fu_name = (String) list.get(0).get("case_fu_name");
		String case_content = (String) list.get(0).get("case_content");
		String case_title = (String) list.get(0).get("case_content");
		String case_fu= (String) list.get(0).get("case_fu");
		map.put("caseStateSelectVal", caseStateSelectVal);
		map.put("casePropSelectVal", casePropSelectVal);
		map.put("case_photo", case_photo);
		map.put("case_fu_name", case_fu_name);
		map.put("case_content", case_content);
		map.put("case_title", case_title);
		map.put("case_fu", case_fu);
		return map;
	}
	
	
}
