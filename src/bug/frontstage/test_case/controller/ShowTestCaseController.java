package bug.frontstage.test_case.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bug.frontstage.test_case.service.imp.FilterTestCaseServiceImp;
import bug.frontstage.test_case.service.imp.ShowProMemberServiceImp;
import bug.frontstage.test_case.service.imp.TestCaseServiceImp;
import bug.frontstage.test_case.service.imp.TestGroupServiceImp;

@Controller
public class ShowTestCaseController {

	private String everycount = "5";
	private String pagecount;

	@Autowired(required = false)
	@Qualifier("TestCaseServiceImp")
	private TestCaseServiceImp testCaseServiceImp;

	@Autowired(required = false)
	@Qualifier("TestGroupServiceImp")
	private TestGroupServiceImp testGroupServiceImp;

	@Autowired(required = false)
	@Qualifier("ShowProMemberServiceImp")
	private ShowProMemberServiceImp showProMemberServiceImp;

	@Autowired(required = false)
	@Qualifier("FilterTestCaseServiceImp")
	private FilterTestCaseServiceImp filterTestCaseServiceImp;
	
	@RequestMapping("/showTestCase")
	public String showTestCase(HttpServletRequest req, int bid, int pid, String currpage) {

		int num = testCaseServiceImp.countTestCase(pid);

		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			List<Map<String, Object>> list = testCaseServiceImp.showAllTestCase(pid, pagecount, everycount);
			List<Map<String, Object>> groupList = testGroupServiceImp.showTestGroup(pid);
			List<Map<String, Object>> produceList = testGroupServiceImp.showProduce(pid);
			List<Map<String, Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
			req.getSession().setAttribute("memberList", memberList);
			req.getSession().setAttribute("produceList", produceList);
			req.getSession().setAttribute("groupList", groupList);
			req.getSession().setAttribute("testCaseList", list);
			req.getSession().setAttribute("numTestCase", num);
			req.getSession().setAttribute("pagecount", pagecount);
			
			List groupFilterList = filterTestCaseServiceImp.goupFilterList("全部", "全部", "全部", "全部",pid);
			List managerFilterList = filterTestCaseServiceImp.managerFilterList("全部", "全部", "全部","全部", pid);
			if(groupFilterList.size()==0){
				req.getSession().setAttribute("groupSize",0 );
				
			}else{
				req.getSession().setAttribute("groupSize",1 );
			}
			if(managerFilterList.size()==0){
				req.getSession().setAttribute("managerSize",0 );
				
			}else{
				req.getSession().setAttribute("managerSize",1 );
			}
			
			 req.getSession().setAttribute("groupFilterList",groupFilterList );
			 req.getSession().setAttribute("managerFilterList", managerFilterList);
			 req.getSession().setAttribute("groupFilter", "全部");
			 req.getSession().setAttribute("propFilter", "全部");
			 req.getSession().setAttribute("managerFilter", "全部");
			 req.getSession().setAttribute("stateFilter", "全部");
			 
			 List produceFilterList = filterTestCaseServiceImp.produceFilterList("全部", "全部", "全部","全部", pid);
				if(produceFilterList.size()==0){
					req.getSession().setAttribute("produceSize",0 );
					
				}else{
					req.getSession().setAttribute("produceSize",1 );
				}
				req.getSession().setAttribute("produceFilterList",produceFilterList );
				req.getSession().setAttribute("produceFilter", "全部");
			return "testCase";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				List<Map<String, Object>> list = testCaseServiceImp.showAllTestCase(pid, "1", everycount);
				List<Map<String, Object>> groupList = testGroupServiceImp.showTestGroup(pid);
				List<Map<String, Object>> produceList = testGroupServiceImp.showProduce(pid);
				List<Map<String, Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
				req.getSession().setAttribute("memberList", memberList);
				req.getSession().setAttribute("produceList", produceList);
				req.getSession().setAttribute("groupList", groupList);
				req.getSession().setAttribute("testCaseList", list);
				req.getSession().setAttribute("numTestCase", num);
				req.getSession().setAttribute("pagecount", pagecount);
				return "testCase";
			} else {
				List<Map<String, Object>> list = testCaseServiceImp.showAllTestCase(pid, currpage, everycount);
				List<Map<String, Object>> groupList = testGroupServiceImp.showTestGroup(pid);
				List<Map<String, Object>> produceList = testGroupServiceImp.showProduce(pid);
				List<Map<String, Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
				req.getSession().setAttribute("memberList", memberList);
				req.getSession().setAttribute("produceList", produceList);
				req.getSession().setAttribute("groupList", groupList);
				req.getSession().setAttribute("testCaseList", list);
				req.getSession().setAttribute("numTestCase", num);
				req.getSession().setAttribute("currpage", currpage);
				req.getSession().setAttribute("pagecount", pagecount);

				List groupFilterList = filterTestCaseServiceImp.goupFilterList("全部", "全部", "全部","全部", pid);
				List managerFilterList = filterTestCaseServiceImp.managerFilterList("全部", "全部", "全部","全部", pid);
				if(groupFilterList.size()==0){
					req.getSession().setAttribute("groupSize",0 );
					
				}else{
					req.getSession().setAttribute("groupSize",1 );
				}
				if(managerFilterList.size()==0){
					req.getSession().setAttribute("managerSize",0 );
					
				}else{
					req.getSession().setAttribute("managerSize",1 );
				}
				
				 req.getSession().setAttribute("groupFilterList",groupFilterList );
				 req.getSession().setAttribute("managerFilterList", managerFilterList);
				 req.getSession().setAttribute("groupFilter", "全部");
				 req.getSession().setAttribute("propFilter", "全部");
				 req.getSession().setAttribute("managerFilter", "全部");
				 req.getSession().setAttribute("stateFilter", "全部");

				 List produceFilterList = filterTestCaseServiceImp.produceFilterList("全部", "全部", "全部","全部", pid);
					if(produceFilterList.size()==0){
						req.getSession().setAttribute("produceSize",0 );
						
					}else{
						req.getSession().setAttribute("produceSize",1 );
					}
					req.getSession().setAttribute("produceFilterList",produceFilterList );
					req.getSession().setAttribute("produceFilter", "全部");
				return "testCase";
			}

		}

	}



}
