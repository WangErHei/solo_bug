package bug.frontstage.test_case.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.test_case.service.imp.ShowProMemberServiceImp;
import bug.frontstage.test_case.service.imp.TestCaseServiceImp;
import bug.frontstage.test_case.service.imp.TestGroupServiceImp;

@Controller
public class ShowTestCaseInfoController {

	@Autowired(required=false)
	@Qualifier("TestCaseServiceImp")
	private TestCaseServiceImp testCaseServiceImp;
	
	@Autowired(required=false)
	@Qualifier("TestGroupServiceImp")
	private TestGroupServiceImp testGroupServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowProMemberServiceImp")
	private ShowProMemberServiceImp showProMemberServiceImp;
	
	@RequestMapping("/showTestCaseInfo")
	public  String showTestCaseInfo(HttpServletRequest req,int caseId,int pid,int bid){
		List<Map<String,Object>> list = testCaseServiceImp.showOneTestCase(caseId);
		List<Map<String,Object>> groupList = testGroupServiceImp.showTestGroup(pid);
		List<Map<String,Object>> produceList = testGroupServiceImp.showProduce(pid);
		List<Map<String,Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
		req.getSession().setAttribute("memberList", memberList);
		req.getSession().setAttribute("produceList", produceList);
		req.getSession().setAttribute("groupList", groupList);
		
		req.getSession().setAttribute("oneTestCase", list);
		req.getSession().setAttribute("testCaseId", caseId);
		
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
		req.getSession().setAttribute("caseGroupSelectVal", caseGroupSelectVal);
		req.getSession().setAttribute("caseProduceSelectVal", caseProduceSelectVal);
		req.getSession().setAttribute("caseManagerSelectVal", caseManagerSelectVal);
		req.getSession().setAttribute("caseStateSelectVal", caseStateSelectVal);
		req.getSession().setAttribute("casePropSelectVal", casePropSelectVal);
		
		
		List<Map<String,Object>> caseBugList = testCaseServiceImp.showCaseBug(pid, caseId);
		req.getSession().setAttribute("caseBugList", caseBugList);
		
		return "caseDetails";
	}
}
