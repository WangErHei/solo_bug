package bug.frontstage.test_case.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.test_case.model.TestCase;
import bug.frontstage.test_case.service.imp.ShowProMemberServiceImp;
import bug.frontstage.test_case.service.imp.TestCaseServiceImp;
import bug.frontstage.test_case.service.imp.TestGroupServiceImp;

@Controller
public class UpdateTestCaseController {

	@Autowired(required=false)
	@Qualifier("TestCaseServiceImp")
	private TestCaseServiceImp testCaseServiceImp;
	
	@Autowired(required=false)
	@Qualifier("TestGroupServiceImp")
	private TestGroupServiceImp testGroupServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowProMemberServiceImp")
	private ShowProMemberServiceImp showProMemberServiceImp;
	
	@RequestMapping("/updateTestCase")
	public  String updateTestCase(HttpServletRequest req,int caseGroupSelect,int caseProduceSelect,String caseTitleSelect,String caseStateSelect,int caseId,
			int pid,int bid,String casePropSelect,int caseManagerSelect,String caseContentSelect){
	String photo= req.getParameter("result8");
    String  file = req.getParameter("results8");
    String  fileName = req.getParameter("resultss8");
		TestCase testCase = new TestCase();
		testCase.setCaseId(caseId);
		testCase.setGroupId(caseGroupSelect);
		testCase.setProduceId(caseProduceSelect);
		testCase.setTitle(caseTitleSelect);
		testCase.setState(caseStateSelect);
		if(casePropSelect.equals("高")){
			testCase.setProp(2);
		}else if(casePropSelect.equals("中")){
			testCase.setProp(1);
		}else{
			testCase.setProp(0);
		}
		testCase.setManagerId(caseManagerSelect);
		testCase.setCreaterId(bid);
		testCase.setContent(caseContentSelect);
		testCase.setProgramId(pid);
		testCase.setPhoto(photo);
    	testCase.setFile(file);
	    testCase.setFileName(fileName);
		testCaseServiceImp.updateTestCase(testCase);
		
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
		return "caseDetails";
	}
}

