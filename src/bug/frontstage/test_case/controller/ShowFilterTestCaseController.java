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
public class ShowFilterTestCaseController {

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

	@RequestMapping("/showFilterTestCase")
	public String showFilterTestCase(HttpServletRequest req, String group,
			String prop, String manager, String state,String produce,int pid, String currpage) {

		int num = filterTestCaseServiceImp.countTestCaseFilter(group, prop, manager, state,produce, pid);

		int count = Integer.parseInt(everycount);
		if (num % count == 0) {
			pagecount = (num / count) + "";
		} else {
			pagecount = (num / count + 1) + "";
		}

		if (Integer.parseInt(currpage) > Integer.parseInt(pagecount)) {
			req.getSession().setAttribute("currpage", pagecount);
			List<Map<String, Object>> list = filterTestCaseServiceImp.showFilterTestCase(group, prop, manager, state,produce, pid, pagecount, everycount);
			List<Map<String, Object>> groupList = testGroupServiceImp.showTestGroup(pid);
			List<Map<String, Object>> produceList = testGroupServiceImp.showProduce(pid);
			List<Map<String, Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
			req.getSession().setAttribute("memberList", memberList);
			req.getSession().setAttribute("produceList", produceList);
			req.getSession().setAttribute("groupList", groupList);
			req.getSession().setAttribute("testCaseList", list);
			req.getSession().setAttribute("numTestCase", num);
			req.getSession().setAttribute("pagecount", pagecount);
			
			List groupFilterList = filterTestCaseServiceImp.goupFilterList(manager, prop, state, produce,pid);
			List managerFilterList = filterTestCaseServiceImp.managerFilterList(group, prop, state, produce,pid);
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
			 req.getSession().setAttribute("groupFilter", group);
			 req.getSession().setAttribute("propFilter", prop);
			 req.getSession().setAttribute("managerFilter", manager);
			 req.getSession().setAttribute("stateFilter", state);
			 
			 
			 List produceFilterList = filterTestCaseServiceImp.produceFilterList(group, manager, prop, state, pid);
				if(produceFilterList.size()==0){
					req.getSession().setAttribute("produceSize",0 );
					
				}else{
					req.getSession().setAttribute("produceSize",1 );
				}
				req.getSession().setAttribute("produceFilterList",produceFilterList );
				req.getSession().setAttribute("produceFilter", produce);
			return "testCase";
		} else {
			if (Integer.parseInt(currpage) < 1) {
				req.getSession().setAttribute("currpage", "1");
				List<Map<String, Object>> list = filterTestCaseServiceImp.showFilterTestCase(group, prop, manager, state, produce,pid, "1", everycount);
				List<Map<String, Object>> groupList = testGroupServiceImp.showTestGroup(pid);
				List<Map<String, Object>> produceList = testGroupServiceImp.showProduce(pid);
				List<Map<String, Object>> memberList = showProMemberServiceImp.showProgramMemberList(pid);
				req.getSession().setAttribute("memberList", memberList);
				req.getSession().setAttribute("produceList", produceList);
				req.getSession().setAttribute("groupList", groupList);
				req.getSession().setAttribute("testCaseList", list);
				req.getSession().setAttribute("numTestCase", num);
				req.getSession().setAttribute("pagecount", pagecount);
				
				List groupFilterList = filterTestCaseServiceImp.goupFilterList(manager, prop, state,produce, pid);
				List managerFilterList = filterTestCaseServiceImp.managerFilterList(group, prop, state,produce, pid);
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
				 req.getSession().setAttribute("groupFilter", group);
				 req.getSession().setAttribute("propFilter", prop);
				 req.getSession().setAttribute("managerFilter", manager);
				 req.getSession().setAttribute("stateFilter", state);
				 
				 List produceFilterList = filterTestCaseServiceImp.produceFilterList(group, manager, prop, state, pid);
					if(produceFilterList.size()==0){
						req.getSession().setAttribute("produceSize",0 );
						
					}else{
						req.getSession().setAttribute("produceSize",1 );
					}
					req.getSession().setAttribute("produceFilterList",produceFilterList );
					req.getSession().setAttribute("produceFilter", produce);
				return "testCase";
			} else {
				List<Map<String, Object>> list = filterTestCaseServiceImp.showFilterTestCase(group, prop, manager, state,produce, pid, currpage, everycount);
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

				List groupFilterList = filterTestCaseServiceImp.goupFilterList(manager, prop, state,produce, pid);
				List managerFilterList = filterTestCaseServiceImp.managerFilterList(group, prop, state, produce,pid);
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
				 req.getSession().setAttribute("groupFilter", group);
				 req.getSession().setAttribute("propFilter", prop);
				 req.getSession().setAttribute("managerFilter", manager);
				 req.getSession().setAttribute("stateFilter", state);
				 List produceFilterList = filterTestCaseServiceImp.produceFilterList(group, manager, prop, state, pid);
					if(produceFilterList.size()==0){
						req.getSession().setAttribute("produceSize",0 );
						
					}else{
						req.getSession().setAttribute("produceSize",1 );
					}
					req.getSession().setAttribute("produceFilterList",produceFilterList );
					req.getSession().setAttribute("produceFilter", produce);
				return "testCase";
			}

		}

	}
	
}
