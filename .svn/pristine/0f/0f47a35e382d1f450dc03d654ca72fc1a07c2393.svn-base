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
public class DeleteTestCaseController {

	private String everycount = "5";
	private String pagecount;
	
	@Autowired(required=false)
	@Qualifier("TestCaseServiceImp")
	private TestCaseServiceImp testCaseServiceImp;
	
	@Autowired(required=false)
	@Qualifier("TestGroupServiceImp")
	private TestGroupServiceImp testGroupServiceImp;
	
	@Autowired(required=false)
	@Qualifier("ShowProMemberServiceImp")
	private ShowProMemberServiceImp showProMemberServiceImp;
	
	@RequestMapping("/deleteTestCase")
	public  String deleteTestCase(HttpServletRequest req,int caseId,int pid,String currpage){
		testCaseServiceImp.deleteOneCase(caseId);
		
		int num = testCaseServiceImp.countTestCase(pid);
		
		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}
		
		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.setAttribute("currpage", pagecount);
			List<Map<String,Object>> list = testCaseServiceImp.showAllTestCase(pid,currpage,everycount);
			List<Map<String,Object>> groupList = testGroupServiceImp.showTestGroup(pid);
			List<Map<String,Object>> produceList = testGroupServiceImp.showProduce(pid);
			List<Map<String,Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
			req.getSession().setAttribute("memberList", memberList);
			req.getSession().setAttribute("produceList", produceList);
			req.getSession().setAttribute("groupList", groupList);
			req.getSession().setAttribute("testCaseList", list);
			req.getSession().setAttribute("numTestCase", num);
			req.setAttribute("pagecount", pagecount);
			return "testCase";
		}else {
			if (Integer.parseInt(currpage) < 1) {
				req.setAttribute("currpage", "1");
				List<Map<String,Object>> list = testCaseServiceImp.showAllTestCase(pid,currpage,everycount);
				List<Map<String,Object>> groupList = testGroupServiceImp.showTestGroup(pid);
				List<Map<String,Object>> produceList = testGroupServiceImp.showProduce(pid);
				List<Map<String,Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
				req.getSession().setAttribute("memberList", memberList);
				req.getSession().setAttribute("produceList", produceList);
				req.getSession().setAttribute("groupList", groupList);
				req.getSession().setAttribute("testCaseList", list);
				req.getSession().setAttribute("numTestCase", num);
				req.setAttribute("pagecount", pagecount);
				return "testCase";
			}else {
				List<Map<String,Object>> list = testCaseServiceImp.showAllTestCase(pid,currpage,everycount);
				List<Map<String,Object>> groupList = testGroupServiceImp.showTestGroup(pid);
				List<Map<String,Object>> produceList = testGroupServiceImp.showProduce(pid);
				List<Map<String,Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
				req.getSession().setAttribute("memberList", memberList);
				req.getSession().setAttribute("produceList", produceList);
				req.getSession().setAttribute("groupList", groupList);
				req.getSession().setAttribute("testCaseList", list);
				req.getSession().setAttribute("numTestCase", num);
				req.setAttribute("currpage", currpage);
				req.setAttribute("pagecount", pagecount);
					
				return "testCase";
			}
			
		}
		
	}
}
